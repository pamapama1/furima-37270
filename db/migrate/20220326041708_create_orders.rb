class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :price  ,null: false
      t.references :user  ,null: false

      t.timestamps
    end
  end
end
