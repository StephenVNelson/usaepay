class CreateEpays < ActiveRecord::Migration[5.2]
  def change
    create_table :epays do |t|
      t.string :command
      t.integer :amount
      t.integer :invoice

      t.timestamps
    end
  end
end
