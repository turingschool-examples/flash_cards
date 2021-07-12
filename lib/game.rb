# frozen_string_literal: true

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# Sets up the CLI and makes playable.
class Game
  attr_reader :round

  def initialize
    @round = Round.new(make_deck)
  end

  def make_deck
     Deck.new(make_cards)
  end

  # This could be refactored?
  def make_cards
    filename = 'cards.txt'
    card_generator = CardGenerator.new(filename)
    card_generator.cards
  end

  def start
    puts welcome_message
    take_turns
    print_results
  end

  def welcome_message
    "Welcome! You're playing with #{@round.deck.cards.count} cards.\n-------------------------------------------------"
  end

  def take_turns
    until @round.current_card.nil?
      puts card_position
      puts current_question
      guess = player_input
      @round.take_turn(guess)
      puts feedback
    end
  end

  def card_position
    "This is card number #{@round.current_index + 1} out of #{@round.deck.cards.count}."
  end

  def current_question
    @round.current_card.question
  end

  def player_input
    gets.chomp
  end

  def feedback
    @round.turns.last.feedback
  end

  def print_results
    puts game_over
    puts total_score
    puts category_scores
  end

  def game_over
    "****** Game over! ******"
  end

  def total_score
    "You had #{@round.number_correct} correct guesses out of #{@round.deck.cards.count} for a total score of #{@round.percent_correct.to_i}%."
  end

  def category_scores
    category_array.map do |category|
      "#{category} - #{@round.percent_correct_by_category(category).to_i}% correct"
    end
  end

  def category_array
    category_array = @round.turns.map { |turn| turn.card.category }
    category_array.uniq
  end
end
