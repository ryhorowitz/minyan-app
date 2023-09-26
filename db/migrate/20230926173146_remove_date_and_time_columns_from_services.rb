class RemoveDateAndTimeColumnsFromServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :date, :date
    remove_column :services, :time, :time
  end
end
