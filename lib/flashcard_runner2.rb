require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'






  def start
#   card1 = Card.new("What is the smallest atomic element?", "Helium",:Chemistry)
#   card2 = Card.new("What is banned in Japanese restaurants?", "Tipping", :Law)
#   card3 = Card.new("What is illegal to duel with in Massachesetts?", "Water Pistols", :Law)
#   card4 = Card.new("What is a group of unicorns known as?", "A blessing", :Animals)
#   card5 = Card.new("Which animal swallows stones to improve it's stability?", "Crocodile", :Animals)
#   card6 = Card.new("If you expose a glass of water to space it will?", "Boil", :Chemistry)

#   cards = [card1, card2, card3, card4, card5, card6]

   cards = CardGenerator.new("./lib/cards.txt").cards
    x = cards.length
    deck = Deck.new(cards)

    round = Round.new(deck)
    i = 1

    puts """
    Welcome! You're playing with #{round.deck.cards.length} cards
    ----------------------------------------------------------
    """
    round.deck.cards.length.times do
      puts """
      This is card number #{i} out of #{x}
      Question: #{cards[0].question}
      ----------------------------------------------------------
      """
      guess = gets.chomp
      i += 1
      turn = round.take_turn(guess)
      puts """
      ----------------------------------------------------------
      #{guess}
      #{turn.feedback}
      """
    end


    round.number_correct
    puts """
    ----------------------------------------------------------
    ****** Game over! ******
    You had #{round.number_correct_turns} correct guesses out of 6 for a total score of #{round.percent_correct.round}%
    Chemistry - #{round.percent_correct_by_category(:Chemistry)}% correct
    Law - #{round.percent_correct_by_category(:Law)}% correct
    Animals - #{round.percent_correct_by_category(:Animals)}% correct
    ----------------------------------------------------------
    """
  end



start
