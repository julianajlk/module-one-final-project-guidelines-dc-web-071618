class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.integer :inventor_id
      t.integer :investor_id
    end

  end
end
