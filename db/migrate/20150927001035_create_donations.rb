class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :phone_number, null: false
      t.decimal :amount, null: false
      t.timestamps null: false
    end
  end
end
