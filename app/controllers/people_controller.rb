class PeopleController < ApplicationController
  respond_to :json

  def index
    respond_with Person.all
  end

  def create
    @person = Person.create(person_params)
    respond_with @person
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    respond_with @person
  end

  def santafy
    Santafier.new(Person.all).santafy!

    render json: Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
