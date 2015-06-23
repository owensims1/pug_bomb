require "rails_helper"

describe PugImageService do
  describe "#pug_image_urls" do
    it "returns a random image url of a pug" do
      pug_image_service = described_class.new

      expect(pug_image_service.pug_image_urls.first).to include("http://")
    end

    it "supports quantity" do
      pug_image_service = described_class.new(3)

      expect(pug_image_service.pug_image_urls.length).to eq(3)
    end
  end
end
