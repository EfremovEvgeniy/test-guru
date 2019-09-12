class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path(user)
    else
      root_path
    end
  end
end
