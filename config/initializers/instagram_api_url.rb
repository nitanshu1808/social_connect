INSTA_API = YAML.load_file("#{Rails.root.to_s}/config/instagram_api_urls.yml")[Rails.env]