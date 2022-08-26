class UserSerializer < ActiveModel::Serializer
  attributes :message
  has_many :requests
  has_many :assets, through: :requests

  def message
    "User #{self.object.name} has been created!!"
  end 
end
