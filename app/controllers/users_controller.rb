class UsersController < ApplicationController
    def index 
        users = User.all 
        # render json: users.to_json(except: [:password_digest, :created_at, :updated_at])
        render json: UserSerializer.new(users, except: :password_digest)
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(include: [:gardens], except: [:password_digest, :created_at, :updated_at])
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: UserSerializer.new(user, except: :password_digest)
        else
            render json: {message: "failed to create"}
        end
    end

    private

    def user_params
        params.require(:garden).permit(:username)
    end

end