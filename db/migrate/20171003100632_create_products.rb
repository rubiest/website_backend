class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.string :default_picture
      t.integer :quantity
      t.boolean :in_stock
      t.decimal :default_price, precision: 8, scale: 2
      t.decimal :sale_price, precision: 8, scale: 2
      t.string :slug

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
