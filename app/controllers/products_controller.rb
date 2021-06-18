class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params[:name], 
      price: params[:price], 
      image_url: params[:image_url],
      description: params[:description]
    )
    save = params[:save]
    if save == "yes"
      created_product.save
    end
    render json: product.as_json
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.price = params[:price]
    product.name = params[:name]
    product.image_url = params[:image_url]
    product.description = params[:description]
    product.save
    render json: product.as_json
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render json: {
      message: "You just deleted this product",
      product: product
    }
  end

end
