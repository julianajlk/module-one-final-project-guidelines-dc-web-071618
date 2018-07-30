class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :company
      t.integer :total_balance_in_dollars
    end
  end
end
ex
