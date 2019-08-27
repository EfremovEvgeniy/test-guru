class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :questions, foreign_key: true
    remove_column :questions, :test_id, :integer
    remove_column :tests, :category_id, :integer
    add_reference :questions, :tests, foreign_key: true
    add_reference :tests, :categories, foreign_key: true
    change_column_default :answers, :correct, from: true, to: false
  end
end
