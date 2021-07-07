class CartedProductsController < ApplicationController
  before_action :authenticate_user
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.destroy
    render json: carted_product.as_json
  end

  def index
    if current_user
      carted_products = current_user.carted_products
      render json: carted_products.as_json
    else
      render json: [], status: :unauthorized
    end
  end
  
end
