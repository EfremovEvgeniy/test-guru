class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :badges, through: :user_badges
  has_many :user_badges, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :his_tests, foreign_key: 'author_id', class_name: 'Test'

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable

  def find_tests_by_level(level)
    tests.find_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
