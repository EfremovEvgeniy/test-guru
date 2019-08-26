class AddChecksForColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :level, default: 0
    add_column :answers, :correct, :boolean, default: false
    change_column_null :tests, :title, false
    change_column_null :tests, :category_id, false
    change_column_null :questions, :body, false
    change_column_null :answers, :body, false
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_null :categories, :title, false
  end
end
