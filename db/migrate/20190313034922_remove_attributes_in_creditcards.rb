class RemoveAttributesInCreditcards < ActiveRecord::Migration[5.2]
  def change
    remove_column :creditcards, :number, :integer
    remove_column :creditcards, :expiration, :integer
    remove_column :creditcards, :cvc, :integer
    remove_column :creditcards, :avs_zip, :integer
    add_column :creditcards, :number, :string
    add_column :creditcards, :expiration, :string
    add_column :creditcards, :cvc, :string
    add_column :creditcards, :avs_zip, :string
  end
end
