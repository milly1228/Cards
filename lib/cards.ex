defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    :world
  end

  def create_desk do
    decks = ["Ace" , "TWO" , "THREE"]
    suits = ["Spades" , "Clubs" , "Hearts" , "Diamonds"]

    for deck <- decks , suit <- suits do
      "#{deck} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck , hand) do
    Enum.member?(deck, hand)
  end

  def deal_with(deck , hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck , filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok , binary} -> :erlang.binary_to_term(binary)
      {:error , _reason} -> "File does not exists"
    end
  end

  def create_hand(hand_size) do
    Cards.create_desk
    |> Cards.shuffle
    |> Cards.deal_with(hand_size)
  end
end
