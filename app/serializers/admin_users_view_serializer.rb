class AdminUsersViewSerializer < ActiveModel::Serializer
  attributes :id,:name, :email,:password,:role
end
