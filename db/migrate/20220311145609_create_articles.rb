class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name,                null:false
      t.integer :category_id         null:false
      t.integer :status_id           null:false
      t.integer :delivery_charge_id  null:false
      t.integer :location_id         null:false
      t.integer :delivery_date_id    null:false
      t.text    :description         null:false
      t.integer :price               null:false
      t.references :user             null:false , foreign_key: true

      t.timestamps
    end
  end
end
