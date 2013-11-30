class PeopleController < ApplicationController
  respond_to :json

  def index
    respond_with Person.all
  end
end
