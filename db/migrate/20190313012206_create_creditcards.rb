class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|
      t.string :hardholder
      t.integer :number
      t.integer :expiration
      t.integer :cvc
      t.string :avs_street
      t.integer :avs_zip

      t.timestamps
    end
  end
end
