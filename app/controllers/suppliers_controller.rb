class SuppliersController < ApplicationController
  def index
    supplier = Supplier.all
    render json: supplier.as_json
  end

  def show
    supplier = Supplier.find_by(id: params[:id])
    render json: supplier.as_json
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    supplier.save
    render json: supplier.as_json
  end

  def update
    supplier = Supplier.find_by(id: params[:id])
    supplier.name = params[:name] || supplier.name
    supplier.email = params[:email] || supplier.email
    supplier.phone_number = params[:phone_number] || supplier.phone_number
    supplier.save
    render json: supplier.as_json
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier.destroy
    render json: {message: "You just deleted this supplier", supplier: supplier}
  end
end
