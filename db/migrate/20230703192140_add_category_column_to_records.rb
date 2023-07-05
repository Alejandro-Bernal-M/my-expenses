class AddCategoryColumnToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :category_id, :bigint
    add_foreign_key :records, :categories
  end
end
