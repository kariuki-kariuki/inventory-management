class UserSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :message, :name, :role, :email
=======
  attributes :message 
>>>>>>> 6e5143e (actin cable setup)
  has_many :requests
  has_many :assets, through: :requests

  def message
    "User #{self.object.name} has been created!!"
  end 
end
