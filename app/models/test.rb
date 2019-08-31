class Test < ApplicationRecord
  # has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  def self.all_by_category(category)
    joins('INNER JOIN categories ON tests.categories_id = categories.id')
      .where(categories: { title: category })
      .order(id: :desc)
      .pluck(:title)
  end
end
