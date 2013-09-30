  ReformExample::Application.routes.draw do
  resources :users
  resources :albums
  root to: "users#index"
end
