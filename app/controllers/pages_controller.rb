class PagesController < ApplicationController
  def home
  end
  def search
    TwitterService.tweet!(params[:text])
  end
end
