class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.integer :idea_id
      t.integer :inventor_id
    end
  end
end
