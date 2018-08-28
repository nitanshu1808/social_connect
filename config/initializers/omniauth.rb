Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['INSTA_APP_ID'], ENV['INSTA_APP_SECRET']
end
