require "rails_helper"

describe V1::PugBombsController do
  describe "#create" do
    it "sends a pug bomb" do
      email = "owensims1@gmail.com"
      quantity = 1

      pug_bomb_service_instance = double("PugBombService", valid?: true)
      expect(PugBombService).to receive(:new).and_return(pug_bomb_service_instance)
      expect(pug_bomb_service_instance).to receive(:send_pug_bomb).and_return(true)

      post :create, email: email, quantity: quantity

      expect(response).to be_success
      expect(JSON.parse(response.body)["message"]).to eq("success")
    end
  end

  context "bad params" do
    it "returns an error" do
      post :create

      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)["errors"]).to include("email must be present")
    end
  end
end
