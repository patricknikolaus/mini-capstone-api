class RemoveImageUrlFromProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :product_id, :integer
    remove_column :products, :image_url, :string
  end
end
