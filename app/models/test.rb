class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :find_by_level, ->(level) { where(level: level).order(:id) }
  scope :find_all_by_category, lambda { |category_name|
                                 joins(:category).where(
                                   categories: { title: category_name }
                                 )
                               }

  def self.all_by_category(category_name)
    find_all_by_category(category_name)
  end

  def self.all_by_level(level)
    find_by_level(level.to_i)
  end
end
