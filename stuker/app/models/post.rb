class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of :content 
  validates_presence_of :scheduled_at
  validates_length_of :content, maximum: 140, message: 'Less then 140 characters please'

  def to_twitter
    client = Twitter::REST::Client.new do |config| 
      config.access_token = self.user.twitter.oauth_token
      config.access_token_secret = self.user.twitter.secret 
      config.consumer_key = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
    end
    client.update(self.content)

  end

end
