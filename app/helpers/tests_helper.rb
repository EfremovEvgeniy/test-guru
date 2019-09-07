module TestsHelper
  def number_of_questions(test)
    test.questions.count
  end
end
