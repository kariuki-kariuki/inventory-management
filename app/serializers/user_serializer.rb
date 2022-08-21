class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role
  has_many :requests
  has_many :asset, through: :requests
end
