class CreateShuls < ActiveRecord::Migration[6.1]
  def change
    create_table :shuls do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
