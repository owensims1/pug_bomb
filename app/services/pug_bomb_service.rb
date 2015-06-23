class PugBombService
  attr_reader :errors

  def initialize(email:, quantity: 1)
    @email = email
    @quantity = quantity
    @errors = []
    validate_email
  end

  def valid?
    errors.empty?
  end

  def send_pug_bomb
    pug_images = PugImageService.new(quantity).pug_image_urls
    quantity.to_i.times do |i|
      Mailer.pug_bomb(email, pug_images[i]).deliver_now #TODO put this into a background job
    end
    true
  end

  private

  attr_reader :email, :quantity

  def validate_email
    #TODO validate actual email
    errors << "email must be present" unless email.present?
  end
end
