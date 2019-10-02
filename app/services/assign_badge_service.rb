class AssignBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send("assign_#{badge.rule}?", badge.param)
    end
  end

  private

  def assign_all_in_category?(category)
    TestPassage.find_by_user_and_test(@user.id, @test.id).count == 1 && \
      Test.all_by_category(category).count == user_tests.all_by_category(category).uniq.count
  end

  def assign_first_try_success?(_params)
    @user.tests.where(id: @test.id).count == 1
  end

  def assign_all_in_level?(level)
    Test.where(level: level.to_i).count == user_tests.where(level: level.to_i).count
  end

  def user_tests
    @test_passage.user.tests
  end
end
