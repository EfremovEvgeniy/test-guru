class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :nullify
  has_many :users, through: :tests_users

  def self.all_by_category(category_name)
    joins(:category).where(categories: { title: category_name }).order(id: :desc).pluck(:title)
  end
end
