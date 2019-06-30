class Round
  attr_reader :the_deck, :turns, :number_correct, :number_correct_by_category, :percent_correct, :percent_correct_by_category

  def initialize(the_deck)
    @the_deck = the_deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    num = @turns.count
    @the_deck.cards[num]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @number_correct += 1 if new_turn.correct?
    return new_turn
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end.count
  end

  def percent_correct
    return ((@number_correct.to_f / @turns.count.to_f).to_f) * 100
  end

  def percent_correct_by_category(category)
    return ((number_correct_by_category(category).to_f / @the_deck.cards_in_category(category).count)) * 100
  end

  def start
    puts "Welcome! You're playing with 8 cards."
    puts "-------------------------------------------------"
    puts "This is card number 1 out of 8."
    puts "Question: What is the capital of Alaska?"
  end

  def correct_answer
    puts "Correct!"
  end

  def incorrect_answer
    puts "Incorrect."
  end

  def start_turn_2
    puts "This is card number 2 out of 8."
    puts "Question: The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?"
  end

  def start_turn_3
    puts "This is card number 3 out of 8."
    puts "Question: Describe in words the exact direction that is 697.5° clockwise from due north?"
  end

  def start_turn_4
    puts "This is card number 4 out of 8."
    puts "Question: What is the capital of Argentina?"
  end

  def start_turn_5
    puts "This is card number 5 out of 8."
    puts "What is the capital of Rhode Island?"
  end

  def start_turn_6
    puts "This is card number 6 out of 8."
    puts "Which year did The Lord of the Rings: Return of the King win Best Picture at the Academy Awards?"
  end

  def start_turn_7
    puts "This is card number 7 out of 8."
    puts "What is the first movie that grossed over 1 billion dollars worldwide at the box office?"
  end

  def start_turn_8
    puts "This is card number 8 out of 8."
    puts "What was the first movie released in the MCU (Marvel Cinematic Universe)?"
  end
end
