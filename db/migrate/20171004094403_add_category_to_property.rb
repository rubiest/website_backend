class AddCategoryToProperty < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :category, foreign_key: true
  end
end
