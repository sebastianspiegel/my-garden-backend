class GardensController < ApplicationController

    def show
        garden = Garden.find(params[:id])
        render json: garden.to_json(include: [:user, :seeds], except: [:created_at, :updated_at])
    end

    def index
        gardens = Garden.all 
        render json: GardenSerializer.new(gardens)
    end

    def create
        byebug
        garden = Garden.new(garden_params)
        if garden.save
            render json: GardenSerializer.new(garden)
        else
            render json: {message: "failed to create"}
        end
    end

    def destroy
        garden = Garden.find(params[:id])
        garden.destroy
        render json: {message: "garden has been deleted"}
    end

    def update 
        garden = Garden.find(params[:id])
        seed = Seed.find(params[:garden][:id])
        # byebug 
        garden.seeds.include?(seed) ? garden.seeds.delete(seed) : garden.seeds << seed 
        if garden.valid?
            render json: garden.to_json(include: [:user, :seeds], except: [:created_at, :updated_at])
        else
            render json: {error: "failed to update"}
        end
    end

    private

    def garden_params
        params.require(:garden).permit(:name, :user_id)
    end

end