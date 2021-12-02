#Iteration 3
require_relative './card'
require_relative './turn'
require_relative './deck'
require_relative './round'
require 'pry'
# Confused on whether I need this or if I pass in round am I good?
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
  and reports about the surface of which planet?", "Mars", :STEM)

card_3 = Card.new("Describe in words the exact direction
   that is 697.5° clockwise from due north?", "North north west", :STEM)
cards= [card_1, card_2, card_3]

deck = Deck.new(cards)
round = Round.new(deck)

class Game
  attr_reader :turns, :round, :deck
  attr_writer :stats_hash, :number_correct
  def initialize(round)
    @round = round
  end
  def welcome
    puts "Welcome! You're playing a game with #{@round.deck.cards.length} cards."
    puts "-------------------------------------------"
    puts "This is card number 1 out of #{@round.deck.cards.length}"
  end

  def start
    puts "Question: #{@round.deck.cards[@round.card_counter].question}"
    user_answer = gets.to_s.chomp
    #this needs to go into round object turns.
    @round.turns << Turn.new(user_answer, @round.deck.cards[@round.card_counter]) #turn or round object?
    #do i need to put in a stats_hash array? Is there where I put attr_writer?
    @round.turns.last.feedback
    @round.turns.last.correct?
    binding.pry
  end

end

game = Game.new(round)
game.welcome
game.start
