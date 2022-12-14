class FeedbacksController < ApplicationController
  def create
    feedback = Feedback.create(feedback_params)
    session[:tweet_url] = feedback.tweet_url 
    redirect_to root_path
  end

  private
  def feedback_params
    params.require(:feedback).permit(:text, :recipient_handle) # tweet_url, tweet_id will happen on the backend
  end
end
