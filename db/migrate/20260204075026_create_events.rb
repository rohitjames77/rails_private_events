class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.integer :no_of_attendence
      t.date :date_of_event
      t.datetime :time_of_event
      t.integer :ticket_price

      t.timestamps
    end
  end
end
