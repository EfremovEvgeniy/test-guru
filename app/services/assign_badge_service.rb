class AssignBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send("assign_#{badge.rule}?", badge.param, badge.rule)
    end
  end

  private

  def assign_all_in_category?(category, rule)
    return unless @test.category.title == category &&
                  @test_passage.success? && uniq_badge(category, rule)

    Test.all_by_category(category).count == @user.success_tests_by_category(category).uniq.count
  end

  def assign_first_try_success?(_params, _params)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.success?
  end

  def assign_all_in_level?(level, rule)
    return unless @test.level == level.to_i &&
                  @test_passage.success? && uniq_badge(level.to_i, rule)

    Test.all_by_level(level).count == @user.success_tests_by_level(level).uniq.count
  end

  def uniq_badge(param, rule)
    @user.badges.exclude? Badge.find_by(rule: rule, param: param)
  end
end
