Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/one_product", controller: "products", action: "get_one_product"
  get "/all_products", controller: "products", action: "get_all_products"
end
