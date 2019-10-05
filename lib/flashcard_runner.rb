# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

class FlashcardRunner
  attr_reader :round,
              :deck

def setup
  @card  = [@question, @answer, @category]
  card_1 = Card.new("What is Princess Leia's home planet?", "Alderaan", :Geography)
  card_2 = Card.new("What planet are Ewoks from?", "Endor", :Geography)
  card_3 = Card.new("Who was the first American woman in space?", "Sally Ride", :STEM)
  card_4 = Card.new("What is the fastest land mammal?", "Cheetah", :STEM)
  card_5 = Card.new("Who was the first man on the moon?", "Neil Armstrong", :STEM)
  @cards = [card_1, card_2, card_3, card_4, card_5]
  @deck  = Deck.new(@cards)
  @round = Round.new(@deck)
end

  def initialize(deck,round)
    @deck = deck
    @round = round
  end

  def start
    puts "Welcome! You are playing with #{round.deck.count} cards."
    puts "~" * 50

    while (@round.turns.count + 1) <= @round.deck.count
      puts "This is card number #{round.turns.count} of 5."
      puts "Question: #{@round.current_card.question}"
      @round.take_turn(gets.chomp.capitalize)
      player_guess.correct?
      puts @round.turn.last.feedback
    #puts "The correct answer is #{deck.card.answer.first}"
    end
    start
  end
end
