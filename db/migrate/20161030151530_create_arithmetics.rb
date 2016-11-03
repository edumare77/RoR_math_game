class CreateArithmetics < ActiveRecord::Migration[5.0]
  def change
    create_table :arithmetics do |t|
      t.integer :subtraction
      t.integer :addition
      t.integer :multiplication
      t.integer :fraction
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :Arithmetics, :user_id
  end
end
