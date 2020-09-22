class BackgroundFacade
  attr_reader :id,
              :type,
              :image

  def initialize(location)
    @id = nil
    @type = "image"
    @image = image_info(location)
  end

  def image_info(location)
    background_service = BackgroundService.new
    image_info = background_service.search(location)
    Background.new(image_info)
  end
end
