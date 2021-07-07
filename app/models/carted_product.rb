class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :order, optional: true

  def tax
    subtotal * 0.09
  end

end
