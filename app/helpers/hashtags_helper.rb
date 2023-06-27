module HashtagsHelper
  def text_with_hashtags(text)
    strip_tags(text).gsub(Hashtag::HASHTAG_FORMAT) do |ht|
      link_to ht, hashtag_path(ht.delete('#').downcase)
    end
  end
end