defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert Cards.hello() == :world
  end

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "test create deck gets 20 cards" do
    data_length = length(Cards.create_deck)
    assert data_length == 12
  end

  test "get cards after shuffle" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end
end
