class RemoveHardholderFromCreditcard < ActiveRecord::Migration[5.2]
  def change
    remove_column :creditcards, :hardholder, :string
    add_column :creditcards, :cardholder, :string
  end
end
