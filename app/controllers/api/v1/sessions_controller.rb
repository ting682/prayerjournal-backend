class Api::V1::SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create, :get_current_user]

    def new

    end

    def create
        # binding.pry
        @user = User.find_by(email_address: params[:user][:email_address])
        if @user && @user.authenticate(params[:user][:password])
            # session[:user_id] = @user.id
            
            # token = encode_token({ user_id: @user.id })
            token = encode_token({ user_id: @user.id })
            # cookies.signed[:user_id] = @user.id
            # cookies.signed[:jwt] = {value: token, httponly: true}
            cookies.signed[:jwt] = {value: token, same_site: :none, secure: true, httponly: true}
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
            # render json: UserSerializer.new(@user), status: :ok
        else
            render json: {
                error: "Login error: email and password do not match records.",
                status: :unauthorized }
            
        end
    end

    def destroy
      cookies.delete(:jwt)
      render json: {message: "Logged out successfully"}, status: :accepted
    end

    def get_current_user
        # binding.pry
        if logged_in?
          render json: UserSerializer.new(current_user)
        else
          render json: {
            error: "No one logged in"
          }
        end
      end

    def user_login_params
        # params { user: {username: 'Chandler Bing', password: 'hi' } }
        params.require(:user).permit(:email_address, :password)
      end
end
