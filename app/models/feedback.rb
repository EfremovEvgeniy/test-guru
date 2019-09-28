class Feedback
  include ActiveModel::Model

  attr_accessor :email, :text

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :text, :email, presence: true
end
