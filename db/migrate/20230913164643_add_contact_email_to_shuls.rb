class AddContactEmailToShuls < ActiveRecord::Migration[6.1]
  def change
    add_column :shuls, :contact_email, :string
  end
end
