require './lib/round'

class FlashcardRunner
  def initialize
    @round = make_round
    @deck = @round.deck
  end

  def run_turns
    @deck.cards.each do |card|
      process_turn
    end
  end

  def process_turn
    puts display_question
    puts get_guess
    geuss = get_guess
    current_turn = @round.take_turn(geuss, @round.current_card)
    puts display_feedback(current_turn)
  end

  def display_feedback(turn)
    turn.feedback
  end

  def display_question
    [
      "This is card number #{@round.turns.size} out of #{@deck.size}.",
      "Question: #{@round.current_card.question}"
    ].join("\n")
  end

  def get_guess
    print ">> "
    gets.chomp
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
    deck = Deck.new([@card_1, @card_2, @card_3])
    Round.new(@deck)
  end
end
