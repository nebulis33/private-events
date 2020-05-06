class CreateInivitations < ActiveRecord::Migration[6.0]
  def change
    create_table :inivitations do |t|
      t.integer :attended_event
      t.integer :attendee_id
      t.timestamps
    end
  end
end
