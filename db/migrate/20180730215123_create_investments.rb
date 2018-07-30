class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.integer :idea_id
      t.integer :inventor_id
      t.integer :amount_invested
    end
  end
end
