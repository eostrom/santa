class GiftsController < ApplicationController
  respond_to :json, :csv

  def index
    @people = Person.includes(:gifts_received => :giver)
    @include_santas = !!params[:include_santas]
    respond_with @people
  end

  def create
    @gift = Gift.create(gift_params)
    respond_with @gift
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update_attributes(gift_params)
    respond_with @gift
  end

  private

  def gift_params
    params.require(:gift).permit(:title, :artist, :giver_id, :recipient_id)
  end
end
