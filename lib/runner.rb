#Iteration 3
require_relative './card'
require_relative './turn'
require_relative './deck'
require_relative './round'
require_relative './card_generator'
require 'pry'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
#   and reports about the surface of which planet?", "Mars", :STEM)
#
# card_3 = Card.new("Describe in words the exact direction
#    that is 697.5° clockwise from due north?", "North north west", :STEM)
# cards= [card_1, card_2, card_3]
#
# deck = Deck.new(cards)
# round = Round.new(deck)
round = $round_jeopardy
class Game
  attr_reader :turns, :round, :deck
  attr_writer :stats_hash, :number_correct
  def initialize(round)
    @round = round
  end
  def welcome
    puts "Welcome! You're playing a game with #{@round.deck.cards.length} cards."
    puts "-------------------------------------------"
    puts "This is card number 1 out of #{@round.deck.cards.length}."
  end

  def start
    puts welcome
    @round.deck.cards.length.times {
    puts "Category: #{@round.deck.cards[@round.card_counter].category}"
    puts "Question: #{@round.deck.cards[@round.card_counter].question}"
    user_answer = gets.to_s.downcase.chomp
    @round.turns << Turn.new(user_answer, @round.deck.cards[@round.card_counter])
    puts @round.feedback
    }
    puts '***** Game over! *****'
    puts "You had #{@round.number_correct} guesses out of #{@round.deck.cards.length} questions correct for a total score of #{@round.percent_correct}%."
    uniq_categories = @round.deck.cards.map {|t| t.category}.uniq
    uniq_categories.each do |category|
      puts "#{category.to_s}: #{@round.percent_correct_by_category(category)} correct"
    end

    #should be improved with REGEX to get answers more consistent.

  end

end

game = Game.new(round)
game.start
