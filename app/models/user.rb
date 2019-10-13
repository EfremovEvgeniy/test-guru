class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  has_many :gists, dependent: :destroy
  has_many :his_tests, foreign_key: 'author_id', class_name: 'Test'

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def count_badges_by_id(badge)
    badges.where(id: badge.id).count
  end

  def success_tests_by_category(category_name)
    category_id = Category.find_by(title: category_name).id
    success_user_tests = []
    test_passages.each do |test_passage|
      success_user_tests << test_passage if test_passage.success? &&
                                            test_passage.test.category.id == category_id
    end
    success_user_tests.map!(&:test)
  end

  def success_tests_by_level(level)
    success_user_tests = []
    test_passages.each do |test_passage|
      success_user_tests << test_passage if test_passage.success? &&
                                            test_passage.test.level == level.to_i
    end
    success_user_tests.map!(&:test)
  end
end
