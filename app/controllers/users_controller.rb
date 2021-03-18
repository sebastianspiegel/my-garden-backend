class UsersController < ApplicationController
    def index 
        users = User.all 
        render json: UserSerializer.new(users, include: :gardens)
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(include: :gardens)
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: UserSerializer.new(user)
        else
            render json: {message: "failed to create"}
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {message: "user has been deleted"}
    end

    def update 
        user = User.find(params[:id])
        if user.update(user_params)
            render json: UserSerializer.new(user)
        else
            render json: {error: "failed to update"}
        end
    end

    private

    def user_params
        params.require(:garden).permit(:username)
    end

end