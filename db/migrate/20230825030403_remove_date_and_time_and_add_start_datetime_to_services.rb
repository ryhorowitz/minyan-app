class RemoveDateAndTimeAndAddStartDatetimeToServices < ActiveRecord::Migration[6.1]
  def up
    remove_column :services, :date
    remove_column :services, :time
    add_column :services, :start_datetime, :datetime
  end

  def down
    add_column :services, :date, :date
    add_column :services, :time, :time
    remove_column :services, :start_datetime
  end
end
