class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.integer :correct_question, default: 0

      t.timestamps
    end
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
  end
end
