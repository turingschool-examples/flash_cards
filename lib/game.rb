require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class Game
  def initialize(round)
    @round = round
    @deck = round.deck
    @current_card = round.current_card_index
    @current_question = round.current_card.question
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"
    card_number_to_deck_count
    current_question_to_ask
  end

  # def rest_of_the_rounds
  #   card_number_to_deck_count
  #   current_question_to_ask
  # end


  def card_number_to_deck_count
    puts "This is card number #{@current_card} of #{@deck.count}" #CURRENT CARD NOT WORKING
  end

  def current_question_to_ask
    puts "Question: #{@current_question}?"
  end



end
