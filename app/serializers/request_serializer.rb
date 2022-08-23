class RequestSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :status, :urgency, :user_id, :asset_id, :quantity
  belongs_to :user
  belongs_to :asset
end
