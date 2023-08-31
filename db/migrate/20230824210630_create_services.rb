class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :shul_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
