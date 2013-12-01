class Santafier
  def initialize(people)
    @people = people
  end

  def santafy!
    # TODO: correct algorithm
    @people.find_each do |giver|
      recipient = pick_recipient(giver)
      giver.add_recipient(recipient) if recipient
    end
  end

  def pick_recipient(giver)
    @people.where(['id <> ?', giver]).first(order: 'RANDOM()')
  end
end
