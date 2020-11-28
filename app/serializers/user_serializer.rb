class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :bio, :email_address
end
