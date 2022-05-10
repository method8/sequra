class CreateDisbursements < ActiveRecord::Migration[5.1]
  def change
    create_table :disbursements do |t|

      t.integer   :order_id
      t.integer   :merchant_id
      t.string    :fee
      t.string    :disbursed_amount

      t.timestamp :created_at
    end
  end
end
