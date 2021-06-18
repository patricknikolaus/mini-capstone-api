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
    name = params[:name]
    price = params[:price]
    description = params[:description]
    created_product = Product.new(name: name, price: price, description: description)
    save = params[:save]
    if save == "yes"
      created_product.save
    end
    render json: created_product.as_json
  end
end
