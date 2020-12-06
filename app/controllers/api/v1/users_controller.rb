class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:create, :show]

    def index
        @users = User.all

        render json: UserSerializer.new(@users)
    end

    def show
        @user = User.find(params[:id])
        
        render json: UserSerializer.new(@user)
    end

    def create
        #binding.pry
        @user = User.new(user_params)
    
        if @user.save
            @token = encode_token(user_id: @user.id)
            #binding.pry
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else

            render :json => {error: @user.errors.full_messages.to_sentence}
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :bio, :password, :password_confirmation, :email_address)
    end
end
