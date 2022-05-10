class CreateShoppers < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoppers, id:false, :primary_key => :id) do |t|
      t.primary_key :id
      t.string :name
      t.string :email
      t.string :nif
    end
  end
end
