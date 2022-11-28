class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :likes
  has_one :user
end
