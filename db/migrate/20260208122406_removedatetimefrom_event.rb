class RemovedatetimefromEvent < ActiveRecord::Migration[8.1]
  def change
remove_column :events, :time_of_event, :dateTime
  end
end
