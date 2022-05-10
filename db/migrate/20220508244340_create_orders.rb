class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table(:orders, id:false, :primary_key => :id) do |t|
      t.primary_key :id
      t.integer     :merchant_id
      t.integer     :shopper_id
      t.decimal     :amount
      t.timestamp   :created_at
      t.timestamp   :completed_at
      t.boolean     :paid
    end
  end
end
