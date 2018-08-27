class User < ApplicationRecord
	# devise modules
  devise :database_authenticatable, :registerable, :omniauthable,
  :omniauth_providers => [:instagram]
end
