class User < ApplicationRecord
	# devise modules
  devise :database_authenticatable, :registerable, :omniauthable
end
