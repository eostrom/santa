class GiftsController < ApplicationController
  respond_to :json

  def update
    @gift = Gift.find(params[:id])
    @gift.update_attributes(gift_params)
    respond_with @gift
  end

  private

  def gift_params
    params.require(:gift).permit(:title, :artist)
  end
end
