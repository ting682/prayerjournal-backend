class ApplicationController < ActionController::API

    include ::ActionController::Cookies

    # WHY?: Will call the authorized method before anything else happens in our app. This will effectively lock down the entire application.
    before_action :authorized

    # STEP 1: Encode/Decode Tokens
    # WHY?: `JWT.encode` takes up to three arguments: a payload to encode, an application secret of the developer's choice, and an optional third that can be used to specify the hashing algorithm used. Typically, we don't need to show the third. This method returns a JWT as a string.
    def encode_token(payload)
        # should store secret in env variable
        JWT.encode(payload, Rails.application.credentials[:secret_cookie])
        # binding.pry
    end

    def auth_header
        #binding.pry
        # http_cookie = request.headers['HTTP_COOKIE'].split("; ")

        cookies.signed[:jwt]

        # binding.pry
        # { Authorization: 'Bearer <token>' }
        # request.headers['Authorization']
    end

    # WHY?: `JWT.decode` takes three arguments as well: a JWT as a string, an application secret, and––optionally––a hashing algorithm.
    def decoded_token
        # binding.pry
        if auth_header
            # token = auth_header.split(' ')[1]
            # header: { 'Authorization': 'Bearer <token>' }
            # The Begin/Rescue syntax allows us to rescue out of an exception in Ruby.
            begin
                # binding.pry
                JWT.decode(auth_header, Rails.application.credentials[:secret_cookie], true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    # STEP 2: Authentication helper methods
    def current_user
        # binding.pry
        # User.find_by(id: session[:user_id])
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
            # binding.pry
        end
    end

    def logged_in?
        !!current_user
    # returns a boolean instead of truthy user object
    end

    # STEP 3: Authorization helper methods
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
