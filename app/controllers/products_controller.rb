class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name], 
      price: params[:price], 
      image_url: params[:image_url],
      description: params[:description]
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
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
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
