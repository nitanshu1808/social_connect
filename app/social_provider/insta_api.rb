class InstaApi

  def initialize(options={})
    @options = options
  end

  def profile_information
    url = INSTA_API["instagram_url"] + INSTA_API["user_self"]
    get_response(url)
  end

  def recent_media
    url = INSTA_API["instagram_url"] + INSTA_API["recent_media"]
    get_response(url)
  end

  def get_response(url)
    puts(url) if Rails.env.development?
    begin
      response = RestClient.get url, {:params => @options}
      JSON.parse(response)["data"]
    rescue RestClient::Unauthorized => error
      @retries ||= 0
      if @retries == 0
        @retries = 1
        retry
      else
        raise error
      end
    end
  end
end
