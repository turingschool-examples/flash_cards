require './lib/round'

class FlashcardRunner
  def initialize
    @round = make_round
    @deck = @round.deck
    @deck_size = @deck.cards.size

    play_game
  end

  def play_game
    puts welcome_message
    run_turns
    ending
  end

  def welcome_message
    [
      "Welcome! You're playing with #{@deck_size} cards.",
      "-------------------------------------------------",
    ].join("\n")
  end

  def run_turns
    @deck.cards.each do |card|
      process_turn
    end
  end

  def process_turn
    puts display_question
    geuss = get_guess
    current_turn = @round.take_turn(geuss)
    puts display_feedback(current_turn)
  end

  def display_question
    [
      "This is card number #{@round.turns.size + 1} out of #{@deck_size}.",
      "Question: #{@round.current_card.question}"
    ].join("\n")
  end

  def get_guess
    print ">> "
    gets.chomp
  end

  def display_feedback(turn)
    turn.feedback
  end

  def ending
    correct = @round.number_correct
    percent = @round.percent_correct
    puts ending_message(correct, percent)
    puts category_correct_percentages
  end

  def ending_message(correct, percent)
    [
      "****** Game over! ******\n",
      "You had #{correct} correct guesses out of #{@deck_size} ",
      "for a total score of #{percent}%."
    ].join
  end

  def category_correct_percentages
    @deck.cards_by_category.keys.map { |category|
      name = format_category_name(category)
      percent = @round.percent_correct_by_category(category)
      "#{name} - #{percent}% correct."
    }.join("\n")
  end

  def format_category_name(category)
    category.to_s.gsub("_", " ").capitalize
  end

  def make_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    Round.new(deck)
  end
end

FlashcardRunner.new
