class Santafier
  THRESHOLD = 3

  def initialize(people)
    @people = people

    @recipients = people.to_a
    @recipients.reject! { |person| done_receiving?(person) }

    @givers = people.to_a.dup
    @givers.reject! { |person| done_giving?(person) }

    @making_progress = true
  end

  def santafy!
    while @making_progress
      @making_progress = false
      @recipients.shuffle.each do |recipient|
        giver = pick_giver(for: recipient)

        give(from: giver, to: recipient) if giver
      end
    end
  end

  def pick_giver(options)
    recipient = options[:for]

    (@givers - [recipient, *recipient.givers.reload]).sample
  end

  def give(options)
    giver = options[:from]
    recipient = options[:to]

    Gift.create(giver: giver, recipient: recipient)
    @making_progress = true

    @givers.delete(giver) if done_giving?(giver)
    @recipients.delete(recipient) if done_receiving?(recipient)
  end

  def done_giving?(giver)
    giver.gifts_given.count == THRESHOLD
  end

  def done_receiving?(recipient)
    recipient.gifts_received.count == THRESHOLD
  end
end
