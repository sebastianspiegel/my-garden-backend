class SeedsController < ApplicationController
    def index 
        seeds = Seed.all 
        render json: SeedSerializer.new(seeds)
    end

    def show
        seed = Seed.find(params[:id])
        render json: seed.to_json
    end

    def create
        # byebug
        seed = Seed.new(seed_params)
        if seed.save
            render json: SeedSerializer.new(seed)
        else
            render json: {message: "failed to create"}
        end
    end

    def destroy
        seed = Seed.find(params[:id])
        seed.destroy
        render json: {message: "seed has been deleted"}
    end

    def update 
        seed = Seed.find(params[:id])
        if seed.update(seed_params)
            render json: SeedSerializer.new(seed)
        else
            render json: {error: "failed to update"}
        end
    end

    private

    def seed_params
        params.require(:seed).permit(:common_name, :latin_name, :img, :info)
    end
end