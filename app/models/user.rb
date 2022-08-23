class User < ApplicationRecord
  has_many :requests
  has_many :assets, through: :requests
end
