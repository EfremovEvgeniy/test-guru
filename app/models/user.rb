require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :his_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }

  has_secure_password

  def find_tests_by_level(level)
    tests.find_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
