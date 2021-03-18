class GardensController < ApplicationController

    def show
        garden = Garden.find(params[:id])
        render json: garden.to_json(include: [:user, :seeds], except: [:created_at, :updated_at])
    end

    def create
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
        if garden.update(garden_params)
            render json: GardenSerializer.new(garden)
        else
            render json: {error: "failed to update"}
        end
    end

    private

    def garden_params
        params.require(:garden).permit(:name, :user_id)
    end

end