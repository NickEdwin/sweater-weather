class Background
  attr_reader :tags,
              :image_url,
              :author,
              :pixabay_site


  def initialize(image_info)
    @tags = image_info[:hits].first[:tags]
    @image_url = image_info[:hits].first[:largeImageURL]
    @author = image_info[:hits].first[:user]
    @pixabay_site = "Pixabay.com"
  end
end
