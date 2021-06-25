class ImagesController < ApplicationController
  def create
    image = Image.new(
      url: params[:url],
      product_id: params[:product_id]
    )
    image.save
    product = Product.find_by(id: params[:product_id])
    render json: {product: product.as_json, images: product.images.as_json}
  end
end
