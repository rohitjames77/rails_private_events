class AddReferencesToAttendances < ActiveRecord::Migration[8.1]
  def change
 add_reference :attendances, :attendee, null: false, foreign_key: { to_table: :users }
    add_reference :attendances, :attended_event, null: false, foreign_key: { to_table: :events }

    remove_column :attendances, :user, :string
  end
end
