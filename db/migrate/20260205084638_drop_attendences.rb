class DropAttendences < ActiveRecord::Migration[8.1]
  def change
    drop_table :attendances
  end
end
