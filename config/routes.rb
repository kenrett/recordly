Rails.application.routes.draw do

  get 'albums/index'

  get 'homes/index'

  devise_for :users
  root to: "homes#index"

  resources :albums, :only => [:index]
end
