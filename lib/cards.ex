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
    {status , binary } = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "File does not exists"
    end
  end
end
