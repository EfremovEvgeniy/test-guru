module TestPassagesHelper
  def test_passages_result(test_passage)
    if test_passage.percentage_correct_answers >= 85
      "You have great score! Your result: #{test_passage.percentage_correct_answers}"
    else
      "Bad result. Try again! Your result: #{test_passage.percentage_correct_answers}"
    end
  end
end
