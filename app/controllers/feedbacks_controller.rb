class FeedbacksController < ApplicationController
  def create
    Feedback.create(feedback_params)
  end

  private
  def feedback_params
    params.require(:feedback).permit(:text, :recipient_handle) # tweet_url, tweet_id will happen on the backend
  end
end
