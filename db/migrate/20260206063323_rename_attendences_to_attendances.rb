class RenameAttendencesToAttendances < ActiveRecord::Migration[8.1]
  def change
    rename_table :attendences, :attendances
  end
end
