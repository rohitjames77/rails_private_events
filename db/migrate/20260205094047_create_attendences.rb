class CreateAttendences < ActiveRecord::Migration[8.1]
  def change
    create_table :attendences do |t|
      t.string :user

      t.timestamps
    end
  end
end
