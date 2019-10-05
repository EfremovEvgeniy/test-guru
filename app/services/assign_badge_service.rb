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
    return unless @test.category.title == category && @test_passage.success?

    TestPassage.find_by_user_and_test(@user.id, @test.id).count == 1 &&
      Test.all_by_category(category).count == @user.tests.all_by_category(category).uniq.count
  end

  def assign_first_try_success?(_params)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.success?
  end

  def assign_all_in_level?(level)
    return unless @test_passage.success? && @test.level == level.to_i

    if Test.all_by_level(level).count == 1
      @user.tests.all_by_level(level).count == 1
    else
      Test.all_by_level(level).to_ary == @user.tests.all_by_level(level).uniq
    end
  end
end
