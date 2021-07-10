require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class FlashcardRunner
  attr_reader :round
  def initialize(round)
    @round = round
  end

  def start_message
    "Welcome! You're playing with #{round.card_count} cards. \n
    ------------------------------------------------- \n"
  end

  def card_count_ratio
    "This is card number #{round.turn_count} out of #{round.card_count}. \n"
  end

  def get_user_input
    gets.chomp
  end

  def start_the_round
    while round.deck.cards.count > 0 do
      card_count_ratio
      @round.current_question
      @round.take_turn(get_user_input).feedback
    end
  end

  def start
    puts start_message
    puts start_the_round
  end
end
