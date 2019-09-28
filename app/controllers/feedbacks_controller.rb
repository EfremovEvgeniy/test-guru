class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.send_feedback(feedback_params).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :text)
  end
end
