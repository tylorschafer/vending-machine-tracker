class CreateVendingSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :vending_snacks do |t|
      t.references :machine, foreign_key: true
      t.references :snack, foreign_key: true
    end
  end
end
