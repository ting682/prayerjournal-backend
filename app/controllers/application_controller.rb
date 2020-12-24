# Dotenv.load('file.env')

class ApplicationController < ActionController::API

    include ::ActionController::Cookies

   
    before_action :authorized

   
   
    def encode_token(payload)
        
        JWT.encode(payload, ENV['JWT_SECRET'])
        
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

    
    def decoded_token
        # binding.pry
        if auth_header
            # token = auth_header.split(' ')[1]
            # header: { 'Authorization': 'Bearer <token>' }
            
            begin
                # binding.pry
                JWT.decode(auth_header, ENV['JWT_SECRET'], true, algorithm: 'HS256')
                
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

    
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
