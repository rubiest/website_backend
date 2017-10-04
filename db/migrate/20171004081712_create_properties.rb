class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :identifying_name, :null => false
      t.string :display_name
      t.boolean :active, default:true

      t.timestamps
    end
  end
end
