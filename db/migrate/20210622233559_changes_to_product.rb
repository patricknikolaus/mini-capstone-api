class ChangesToProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :price, :decimal
    add_column :products, :inventory, :integer
  end
end

#price will be deicmal instead of integer
#add inventory columb