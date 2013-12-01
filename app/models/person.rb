class Person < ActiveRecord::Base
  has_many :gifts_given, class_name: 'Gift', foreign_key: 'giver_id'
  has_many :gifts_received, class_name: 'Gift', foreign_key: 'recipient_id'
  has_many :recipients, class_name: 'Person', through: :gifts_given
  has_many :givers, class_name: 'Person', through: :gifts_received

  def as_json(options = {})
    super(only: [:id, :name], methods: [:gift_recipient_names])
  end

  def gift_recipient_names
    recipients.map(&:name)
  end

  def add_recipient(recipient)
    recipients << recipient
  end
end
