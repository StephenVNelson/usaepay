class AddCreditcardToEpay < ActiveRecord::Migration[5.2]
  def change
    add_reference :epays, :creditcard, foreign_key: true
  end
end
