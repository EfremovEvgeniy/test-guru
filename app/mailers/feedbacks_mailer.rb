class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback_params)
    @email = feedback_params[:email]
    @text = feedback_params[:text]

    mail to: Admin.order('RANDOM()').first.email
  end
end
