defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List comprehension (for loop in Elixir)
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end


  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. The `hand_size` argument indicates how many cards should be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok , binary} -> :erlang.binary_to_term binary
      {:error, reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck   # creates a deck (like saying deck = Cards.create_deck)
    |> Cards.shuffle    # takes the deck created above and shuffles it (like "re-assigning" deck -> deck = Cards.shuffle)
    |> Cards.deal(hand_size) # this here is like saying hand = Cards.deal(deck, hand_size)

    # Since we're piping in the results of the last function, we don't need to pass  in the deck in Cards. deal, it happens automatically.
  end
end


# To compile and run code, in terminal, use iex -S mix
# That allows you to call the module, and the method within
# e.g. iex(1) Cards.hello
# returns "hi there!"
