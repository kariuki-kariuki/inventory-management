class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role
  has_many :requests
  has_many :assets, through: :requests
end
