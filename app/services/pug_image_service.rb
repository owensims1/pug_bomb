class PugImageService
  include HTTParty

  def initialize(quantity=1)
    @quantity = quantity
  end

  def pug_image_urls
    pugs = self.class.get("http://pugme.herokuapp.com/bomb?count=#{quantity}")["pugs"]
  end

  private

  attr_reader :quantity
end
