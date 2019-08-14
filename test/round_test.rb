require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_it_has_a_current_card
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal card1, round.current_card
  end

  def test_it_tracks_turns
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal [], round.turns

    turn1 = round.take_turn("Helium")

    assert_equal [turn1], round.turns

  end

  def test_it_returns_number_correct
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)
    turn1 = round.take_turn("Helium")
    turn2 = round.take_turn("Standing")
    turn3 = round.take_turn("Water Pistols")
    assert_equal 2, round.number_correct
  end

  def test_it_returns_number_correct_by_category
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)


    round = Round.new(deck)
    turn1 = round.take_turn("Helium")
    turn2 = round.take_turn("Standing")
    turn3 = round.take_turn("Water Pistols")

    assert turn1.correct?
    refute turn2.correct?
    assert turn3.correct?

    assert_equal 1, round.number_correct_by_category(:Chemistry)
    assert_equal 1, round.number_correct_by_category(:Law)
  end

  def test_it_returns_percent_correct
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)
    turn1 = round.take_turn("Helium")
    turn2 = round.take_turn("Tipping")
    turn3 = round.take_turn("Water Pistols")
    round.number_correct 
    assert_equal 100.0, round.percent_correct
  end

  def test_it_returns_percent_correct_by_category
    card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
    card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
    card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    round = Round.new(deck)
    turn1 = round.take_turn("Helium")
    turn2 = round.take_turn("Standing")
    turn3 = round.take_turn("Water Pistols")



    assert_equal 100.0, round.percent_correct_by_category(:Chemistry)
    assert_equal 50.0, round.percent_correct_by_category(:Law)

  end



end
