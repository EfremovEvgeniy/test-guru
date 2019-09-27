class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :email, null: false
      t.text :text, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
