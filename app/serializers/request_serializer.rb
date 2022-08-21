class RequestSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :status, :urgency, :user_id, :asset_id, :quantity
end
