class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.belongs_to :giver, index: true
      t.belongs_to :recipient, index: true

      t.timestamps
    end
  end
end
