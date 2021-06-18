Rails.application.routes.draw do
  get "/products", controller: "products", action: "index" 
  get "/products/:id", controller: "products", action: "show" 
end
