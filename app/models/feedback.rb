class Feedback < ApplicationRecord
  belongs_to :user, optional: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :text, :email, presence: true
end
