class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_discounted?, :price, :tax, :total, :created_at, :updated_at, :inventory, :supplier, :images, :categories
end
