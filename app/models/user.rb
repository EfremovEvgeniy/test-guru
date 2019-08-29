class User < ApplicationRecord
  def find_tests_by_level(level)
    Test.joins('INNER JOIN user_tests ON user_tests.tests_id = tests.id').where(
      'user_tests.users_id= :id AND tests.level= :level', id: id, level: level
    )
  end
end
