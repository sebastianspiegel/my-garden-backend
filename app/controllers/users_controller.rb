class UsersController < ApplicationController

    # skip_before_action :verify_authenticity_token

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
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                user: user,
                jwt: token,
                success: true
            }
        else
            render json: {message: "Unable to creat account. Please make sure your username is at least 4 characters long and your passwords match."}
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end