class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :bio, :email_address, :profile_url, :admin, :editor
end
