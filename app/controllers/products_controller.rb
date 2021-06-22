class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json(methods: [:is_discounted?, :tax, :total])
  end

  def create
    product = Product.new(
      name: params[:name], 
      price: params[:price], 
      image_url: params[:image_url],
      description: params[:description]
    )
    product.save
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.price = params[:price]
    product.name = params[:name]
    product.image_url = params[:image_url]
    product.description = params[:description]
    product.save
    render json: product.as_json
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
