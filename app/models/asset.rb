class Asset < ApplicationRecord
  has_many :requests
  has_one :user
end
