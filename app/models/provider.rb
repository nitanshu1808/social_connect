class Provider < ApplicationRecord
  #validations
  validates_presence_of 	:uid, :provider_name, :token
  validates_uniqueness_of :uid, scope: :provider_name
  #################################################################################################

  #associations
  belongs_to :user, inverse_of: :provider
  #################################################################################################
end
