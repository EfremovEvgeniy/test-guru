class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :his_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, presence: true

  def find_tests_by_level(level)
    tests.find_by_level(level)
  end
end
