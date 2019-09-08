class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_next_question

  SUCCESS_PERCENTAGE = 85

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def questions_count
    test.questions.count
  end

  def percentage_correct_answers
    (correct_question.to_f / test.questions.count * 100).to_i
  end

  def success?
    percentage_correct_answers >= SUCCESS_PERCENTAGE
  end

  def number_current_question
    test.questions.where('id < ?', current_question.id).count + 1
  end

  private

  def before_save_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
