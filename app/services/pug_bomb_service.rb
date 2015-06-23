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
    pug = "http://i.dailymail.co.uk/i/pix/2013/06/13/article-0-1A4BB14C000005DC-554_634x429.jpg" #TODO Make random via API call
    quantity.to_i.times do
      #TODO put this into a background job
      Mailer.pug_bomb(email, pug).deliver_now
    end
  end

  private

  attr_reader :email, :quantity

  def validate_email
    #TODO validate actual email
    errors << "email must be present" unless email.present?
  end
end
