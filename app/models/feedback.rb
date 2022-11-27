class Feedback < ApplicationRecord
  # 1. user creates a feedback record
  # 2. tweet the "text" attribute to the "recipient_handle" attribute
  # validations
  before_create:sanitize 
  
  after_create :send_tweet

  validates_presence_of :recipient_handle, :text ,message: "Recipient handle Can't be blank" # recipient_handle can't be blank
  validates_length_of :text, minimum: 20, maximum: 250

  def sanitize
    # insert any logic we want regarding the trnasformation of text, recipient_handle, etc fields
    self.recipient_handle = self.recipient_handle.gsub('@', '') #removes the @ if put in the recipeint handle field
  end
  def send_tweet
    TwitterService.tweet!(self)
    # twitter logic here
  end
end

