class PeopleController < ApplicationController
  respond_to :json, :csv

  def index
    @people = Person.all
    respond_with @people
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

  def desantafy
    Desantafier.new(Person.all).desantafy!

    render json: Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
