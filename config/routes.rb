Rails.application.routes.draw do
  root "links#random"
  get "r", to: "links#random"
  get ":uid", to: "links#go"

  resources :links, param: :uid, except: :index
end
