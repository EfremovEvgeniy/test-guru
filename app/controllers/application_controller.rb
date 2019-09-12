class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_tests)
    admin_tests_path(current_user)
  end
end
