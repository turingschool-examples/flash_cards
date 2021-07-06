require './lib/round'

class FlashcardRunner
  def initialize
    @round = make_round
    @deck = @round.deck

    play_game
  end

  def play_game
    run_turns
    ending
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
      "This is card number #{@round.turns.size + 1} out of #{@deck.cards.size}.",
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
    total = @deck.cards.size
    percent = @round.percent_correct
    puts ending_message(correct, total, percent)
    puts category_correct_percentages
  end

  def ending_message(correct, total, percent)
    [
      "****** Game over! ******\n",
      "You had #{correct} correct guesses out of #{total} ",
      "for a total score of #{percent}%."
    ].join
  end

  def category_correct_percentages
    @deck.cards_by_category.keys.map { |category|
      name = category.to_s.gsub("_", " ").capitalize
      percent = @round.percent_correct_by_category(category)
      "#{name} - #{percent}% correct."
    }.join("\n")
  end

  def welcome_message
    [
      "Welcome! You're playing with 4 cards.",
      "-------------------------------------------------",
      "This is card number 1 out of 4.",
      "Question: What is 5 + 5?"
    ].join("\n")
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
