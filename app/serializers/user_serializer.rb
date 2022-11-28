class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :pic, :password_digest
end
