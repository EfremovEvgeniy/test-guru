class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :find_by_level, ->(level) { where(level: level) }
  scope :find_all_by_category, lambda { |category_name|
                                 joins(:category).where(
                                   categories: { title: category_name }
                                 )
                               }

  def self.all_by_category(category_name)
    find_all_by_category(category_name).order(id: :desc).pluck(:title)
  end
end
