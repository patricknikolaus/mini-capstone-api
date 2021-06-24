class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_discounted?, :price, :tax, :total, :image_url, :created_at, :updated_at, :inventory, :supplier_id
end
