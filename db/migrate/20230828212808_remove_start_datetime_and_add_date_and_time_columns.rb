class RemoveStartDatetimeAndAddDateAndTimeColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :start_datetime

    add_column :services, :date, :date
    add_column :services, :time, :time
  end
end
