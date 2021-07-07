class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_discounted?, :price, :tax, :total, :created_at, :updated_at, :inventory
  belongs_to :supplier
  has_many :images
  has_many :categories
end
