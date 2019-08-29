class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|
      t.boolean :passed, default: false

      t.timestamps
    end

    add_reference :user_tests, :users, foreign_key: true
    add_reference :user_tests, :tests, foreign_key: true

    change_column_null :user_tests, :users_id, false
    change_column_null :user_tests, :tests_id, false
  end
end
