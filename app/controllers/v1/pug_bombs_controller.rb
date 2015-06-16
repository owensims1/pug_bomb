class V1::PugBombsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    pug_bomb_service = PugBombService.new(email: params[:email], quantity: params[:quantity])
    return render json: { errors: pug_bomb_service.errors }, status: 400 unless pug_bomb_service.valid?

    pug_bomb_service.send_pug_bomb
    render json: { message: "success" }
  end
end
