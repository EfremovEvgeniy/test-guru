class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @feedback = Feedback.new
  end

  def create
    if user_signed_in?
      current_user.feedbacks.build(feedback_params).save
    else
      Feedback.create(feedback_params)
    end
    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :text)
  end
end