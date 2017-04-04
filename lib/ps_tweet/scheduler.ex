defmodule PsTweet.Scheduler do

  def schedule_file(schedule, file) do
    Quantum.add_job(schedule, fn ->
      PsTweet.FileReader.get_strings_to_tweet(file)
      |> PsTweet.Tweet.send_tweet
     end)
  end
  
end