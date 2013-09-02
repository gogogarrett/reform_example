ReformExample::Application.routes.draw do
  resources :users
  resources :artists
  resources :albums
  root to: "users#new"
end
