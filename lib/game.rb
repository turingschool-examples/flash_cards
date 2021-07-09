require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Sets up the CLI and makes playable.
class Game
  attr_reader :round

  def initialize
    @round = make_round
  end

  # This could be refactored? Right now it both makes cards, and returns array containing them.
  def make_cards
    card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    card_2 = Card.new("What is Rachel's favorite animal?", "jabberwocky", "Turing Staff")
    card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Beiber", "Pop Culture")
    [card_1, card_2, card_3, card_4]
  end

  def make_deck
    Deck.new(make_cards)
  end

  def make_round
    Round.new(make_deck)
  end

  # Not sure how to refactor.
  def start
    puts welcome_message
    take_turns
    print_results
  end

  def welcome_message
    "Welcome! You're playing with #{@round.deck.cards.count} cards.\n-------------------------------------------------"
  end

  # Not sure how to refactor.
  def take_turns
    until @round.current_card == nil
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
