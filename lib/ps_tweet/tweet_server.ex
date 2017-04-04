defmodule PsTweet.TweetServer do
  @moduledoc false
  
  use GenServer

  def start_link() do

    GenServer.start_link(__MODULE__, :ok, name: :auto_tweet_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

#  def handle_call(_msg, _from, state) do
#    {:reply, :ok, state}
#  end

  def handle_cast({:tweet, tweet}, _) do
    PsTweet.Tweet.send_tweet(tweet)
    {:noreply, %{}}
  end

  def tweet(tweet) do
    GenServer.cast(:auto_tweet_server, {:tweet, tweet})
  end
end