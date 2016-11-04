class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :subtraction
      t.integer :addition
      t.integer :multiplication
      t.references :user, foreign_key: true
      t.references :arithmetic, foreign_key: true

      t.timestamps
    end
    add_index :results, [:user_id, :arithmetic_id]
  end
end
