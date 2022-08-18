class AssetSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :category, :description, :quantity
end
