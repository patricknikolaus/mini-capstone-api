class ProductsController < ApplicationController
  def index
    if current_user
      products = Product.all
      render json: {message: "Welcome #{current_user.username}!", products: products}
    else
      render json: {message: "Please login or signup to view."}
    end
  end

  def show
    if current_user
      product = Product.find_by(id: params[:id])
      render json: {message: "Welcome #{current_user.username}!", product: product}
    else
      render json: {message: "Please login or signup to view."}
    end
  end

  def create
    product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if product.save
      render json: product
    else
      render json: {error: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    product.price = params[:price] || product.price
    product.name = params[:name] || product.name
    product.description = params[:description] || product.description
    product.supplier_id = params[:supplier_id] || product.supplier_id
    if product.save
      render json: product
    else
      render json: {error: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {
      message: "You just deleted this product",
      product: product
    }
  end

end
