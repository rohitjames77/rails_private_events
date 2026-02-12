class DropEventAttendances < ActiveRecord::Migration[8.1]
  def change
    drop_table :event_attendances
  end
end
