require "rails_helper"

describe "Pug bomb API" do
  it "sends email[s] with a picture of a pug" do
    email = "owensims1@gmail.com"
    quantity = 1

    post "/v1/pug_bombs", email: email, quantity: quantity

    expect(response).to be_success
    expect(ActionMailer::Base.deliveries.last.to).to include("owensims1@gmail.com")
  end
end
