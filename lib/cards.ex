defmodule Cards do
  def hello do
    "hi there!"
  end

  def create_deck do
    ["Ace", "Two", "Three"]
  end
end


# To compile and run code, in terminal, use iex -S mix
# That allows you to call the module, and the method within
# e.g. iex(1) Cards.hello
# returns "hi there!"
