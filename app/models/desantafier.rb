class Desantafier
  def initialize(people)
    @people = people
  end

  def desantafy!
    Gift.destroy_all
  end
end
