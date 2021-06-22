class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :tax, :total, :image_url
end
