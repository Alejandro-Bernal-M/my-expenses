class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :name
      t.integer :author_id
      t.float :amount

      t.timestamps
    end

    add_foreign_key :records, :users, column: :author_id
  end
end
