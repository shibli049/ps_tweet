defmodule PsTweet.Tweet do
  def send_tweet(str) do
    ExTwitter.configure(:process, [
      consumer_key: System.get_env("PS_TWT_CN_KEY"),
      consumer_secret: System.get_env("PS_TWT_CN_SECRET"),
      access_token: System.get_env("PS_TWT_ACC_TOKEN"),
      access_token_secret: System.get_env("PS_TWT_ACC_SECRET")
    ])
    ExTwitter.update(str)
  end
  
end