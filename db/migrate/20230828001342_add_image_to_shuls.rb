class AddImageToShuls < ActiveRecord::Migration[6.1]
  def change
    add_column :shuls, :img, :string
  end
end
