Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"}

  unauthenticated :user do
    root to: 'home#index' #declaring the root path
  end

  authenticated :user do
    root to: 'home#index' #declaring the root path
  end
end
