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
    it "sends a pug bomb" do
      pug_bomb = PugBombService.new(email: "owensims1@gmail.com")

      response = pug_bomb.send_pug_bomb

      expect(response).to eq(true)
      expect(ActionMailer::Base.deliveries.last.to).to include("owensims1@gmail.com")
    end
  end
end
