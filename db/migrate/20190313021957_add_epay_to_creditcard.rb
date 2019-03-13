class AddEpayToCreditcard < ActiveRecord::Migration[5.2]
  def change
    add_reference :creditcards, :epay, foreign_key: true
    remove_column :epays, :creditcard_id, :bigint
  end
end
