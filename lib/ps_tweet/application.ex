defmodule PsTweet.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: PsTweet.Worker.start_link(arg1, arg2, arg3)
      # worker(PsTweet.Worker, [arg1, arg2, arg3]),
       worker(PsTweet.TweetServer, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PsTweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    path = Path.join("#{:code.priv_dir(:ps_tweet)}", "sample.txt")
    PsTweet.Scheduler.schedule_file("* * * * *", path)

    process
  end
end
