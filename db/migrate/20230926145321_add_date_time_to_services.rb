class AddDateTimeToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :datetime, :datetime
  end
end
