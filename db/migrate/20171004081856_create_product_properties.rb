class CreateProductProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :product_properties do |t|
      t.references :product, foreign_key: true
      t.references :property, foreign_key: true
      t.string :description, null: false

      t.timestamps
    end
  end
end
