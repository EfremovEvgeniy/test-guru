class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_tests)
    if current_user.is_a?(Admin)
      admin_tests_path(current_user)
    else
      root_path
    end
  end
end
