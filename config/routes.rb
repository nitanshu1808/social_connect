Rails.application.routes.draw do
  root to: 'home#index' #declaring the root path
  devise_for :users
end
