class RenameNameToEventNameInEvents < ActiveRecord::Migration[8.1]
  def change
    rename_column :events, :name, :event_name
  end
end
