class Gift < ActiveRecord::Base
  belongs_to :giver, class_name: 'Person'
  belongs_to :recipient, class_name: 'Person'
end
