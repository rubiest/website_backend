class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.references :product, foreign_key: true
      t.string :sku, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :variants, :sku, unique: true
  end
end
