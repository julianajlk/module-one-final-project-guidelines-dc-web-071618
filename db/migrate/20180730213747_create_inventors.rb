class CreateInventors < ActiveRecord::Migration[5.0]
  def change
    create_table :inventors do |t|
      t.string :name
      t.string :company
    end
  end
end
