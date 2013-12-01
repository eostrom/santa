class Santafier
  def initialize(people)
    @people = people

    @recipients = people.to_a.dup
    @givers = people.to_a.dup
  end

  def santafy!
    # TODO: correct algorithm
    @recipients.shuffle.each do |recipient|
      giver = pick_giver(for: recipient)

      give(from: giver, to: recipient) if giver
    end
  end

  def pick_giver(options)
    recipient = options[:for]

    (@givers - [recipient]).sample
  end

  def give(options)
    giver = options[:from]
    recipient = options[:to]

    Gift.create(giver: giver, recipient: recipient)
    @givers.delete(giver)
    @recipients.delete(recipient)
  end
end
