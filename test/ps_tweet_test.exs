defmodule PsTweetTest do
  use ExUnit.Case
  doctest PsTweet

  test "the truth" do
    assert 1 + 1 == 2
  end

  @tag watching: true
  test "the failure" do
    assert 1 + 2 <= 4
  end
end
