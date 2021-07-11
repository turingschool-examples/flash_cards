require './lib/round'
require './lib/card_generator'

class Game
  include CardGenerator

  attr_reader :round, :deck, :deck_size

  def initialize
    @round = make_round
    @deck = @round.deck
    @deck_size = @deck.cards.size
  end

  def play_game
    puts welcome_message
    run_turns
    ending
  end

  def welcome_message
    [
      "Welcome! You're playing with #{@deck_size} cards.",
      "-------------------------------------------------"
    ].join("\n")
  end

  def run_turns
    @deck.cards.each do |card|
      process_turn
    end
  end

  def process_turn
    puts current_question
    guess = get_guess
    current_turn = @round.take_turn(guess)
    puts current_turn.feedback
  end

  def current_question
    [
      "This is card number #{@round.turns.size + 1} out of #{@deck_size}.",
      "Question: #{@round.current_card.question}"
    ].join("\n")
  end

  def get_guess
    print ">> "
    answer = gets.chomp
    while answer == ""
      answer_prompt
      answer = gets.chomp
    end
    answer
  end

  def answer_prompt
    puts "Please enter your answer."
    print ">> "
  end
  
  def ending
    correct = @round.number_correct
    percent = @round.percent_correct
    puts ending_message(correct, percent)
    puts category_correct_percentages
  end

  def ending_message(correct, percent)
    line_2_part_1 = "You had #{correct} correct guesses out of #{@deck_size} "
    line_2_part_2 = "for a total score of #{percent}%."
    [
      "****** Game over! ******",
      line_2_part_1 + line_2_part_2
    ].join("\n")
  end

  def category_correct_percentages
    @deck.cards_by_category.keys.map do |category|
      name = format_category_name(category)
      percent = @round.percent_correct_by_category(category)

      "#{name} - #{percent}% correct."
    end
  end

  def format_category_name(category)
    if category.to_s.include?("_")
      words = category.to_s.split("_")
    else
      words = category.to_s.split(" ")
    end

    words.map { |word| word.capitalize }.join(" ")
  end

  def make_round
    deck = Deck.new(CardGenerator.make_cards_from_file)
    Round.new(deck)
  end
end
