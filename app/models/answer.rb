class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :count_answers_for_question, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def count_answers_for_question
    errors.add(:base, 'more then four answers for one question') if question.answers.count >= 4
  end
end
