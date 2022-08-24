class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence:true
  validates :role, presence: true


  has_many :requests
  has_many :assets, through: :requests
end
