class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      product = Product.find_by(id: carted_product.product_id)
      calculated_subtotal += carted_product.quantity * product.price
    end
    
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax:calculated_tax,
      total: calculated_total,
    )
    order.save
    order = Order.last
    carted_products.each do |carted_product|
      carted_product.order_id = order.id
      carted_product.status = "purchased"
      carted_product.save
    end

    render json: order.as_json
  end

  def show
    order = Order.find_by(id: params[:id])
    if current_user.id == order.user_id
      render json: {message: "Welcome #{current_user.username}!", product: order.as_json}
    else
      render json: {message: "Please login or signup to view."}
    end
  end

  def index
    if current_user
      orders = current_user.orders
      render json: orders.as_json
    else
      render json: [], status: :unauthorized
    end
  end
end
