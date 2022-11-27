class Feedback < ApplicationRecord
  # 1. user creates a feedback record
  # 2. tweet the "text" attribute to the "recipient_handle" attribute
  after_create :send_tweet
  def send_tweet
    puts "Sending tweet"
    TwitterService.tweet!(self)
    # twitter logic here
  end
end
