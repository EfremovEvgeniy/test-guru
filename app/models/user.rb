class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :his_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, presence: true

  def find_tests_by_level(level)
    tests.find_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
