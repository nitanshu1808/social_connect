module UtilityHelper
  # This module provides all the utility functions

  def pluralize_word(string, count)
    string.pluralize(count)
  end

  def image_url(media)
    media["images"]["standard_resolution"]["url"]
  end

  def image_caption(media)
    media["caption"] && media["caption"]["text"]
  end

  def like_count(media)
    media["likes"]["count"]
  end

  def comment_count(media)
    media["comments"]["count"]
  end

  def image_location(media)
    media["location"] && media["location"]["name"].truncate(23, omission: '.')
  end

  def user_info(media)
    media["user"]["username"]
  end

end
