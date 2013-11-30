class PeopleController < ApplicationController
  respond_to :json

  def index
    respond_with Person.all
  end

  def create
    @person = Person.create(person_params)
    respond_with @person
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
