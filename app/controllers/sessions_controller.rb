class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        user = User.find_by(username: session_params[:username])
        if user && user.authenticate(session_params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                user: user,
                jwt: token,
                logged_in: true 
            }
        else
            render json: {message: "Log in error. Password or username invalid."}
        end
    end

    def is_logged_in?
        if session_user
            render json: session_user
        else
            render json: {message: "No user is logged in."}
        end
    end

    def destroy
        logout!
        render json: {
            status: 200,
            logged_out: true
        }
    end

    private

    def session_params
        params.require(:user).permit(:username, :password)
    end
end