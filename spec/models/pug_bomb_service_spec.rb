require "rails_helper"

describe PugBombService do
  it "validates presence of email" do
    pug_bomb = PugBombService.new(email: "")
    expect(pug_bomb.errors).to include("email must be present")
  end

  describe "#valid?" do
    it "returns false when there are errors" do
      pug_bomb = PugBombService.new(email: "")
      expect(pug_bomb.valid?).to be false
    end
  end

  describe "#send_pug_bomb" do
    before { ActionMailer::Base.deliveries = [] }

    it "sends a pug bomb" do
      pug_url = ["http://i.dailymail.co.uk/i/pix/2013/06/13/article-0-1A4BB14C000005DC-554_634x429.jpg"]
      pug_image_finder_instance = double("PugImageFinder")
      expect(PugImageService).to receive(:new).and_return(pug_image_finder_instance)
      expect(pug_image_finder_instance).to receive(:pug_image_urls).and_return(pug_url)


      pug_bomb = PugBombService.new(email: "owensims1@gmail.com")
      response = pug_bomb.send_pug_bomb

      expect(response).to be true
      expect(ActionMailer::Base.deliveries.last.to).to include("owensims1@gmail.com")
      expect(ActionMailer::Base.deliveries.last.body).to include(pug_url.first)
    end

    it "supports quantity" do
      pug_urls = ["abc", "def"]
      pug_image_finder_instance = double("PugImageFinder")
      expect(PugImageService).to receive(:new).with(2).and_return(pug_image_finder_instance)
      expect(pug_image_finder_instance).to receive(:pug_image_urls).and_return(pug_urls)


      pug_bomb = PugBombService.new(email: "owensims1@gmail.com", quantity: 2)
      response = pug_bomb.send_pug_bomb

      expect(response).to be true
      expect(ActionMailer::Base.deliveries.first.to).to include("owensims1@gmail.com")
      expect(ActionMailer::Base.deliveries.first.body).to include(pug_urls.first)
      expect(ActionMailer::Base.deliveries.last.to).to include("owensims1@gmail.com")
      expect(ActionMailer::Base.deliveries.last.body).to include(pug_urls.last)
    end
  end
end
