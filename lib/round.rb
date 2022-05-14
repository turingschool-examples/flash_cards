class Round
  attr_reader :deck, :turns, :number_correct, :percent_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @percent_correct = 0.0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess = gets.chomp)
    turn = Turn.new(guess, current_card)
    turns << turn
    if turn.correct?
      @number_correct += 1
    end
    deck.cards.shift
    puts turn.feedback
    turn
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0
    turns.each do |turn|
      if turn.card.category == category && turn.correct?
        number_correct_by_category += 1
      end
    end
    number_correct_by_category
  end

  def percent_correct
    (number_correct.to_f / turns.count) * 100.0
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) / deck.cards_in_category(category).count.to_f * 100.0
  end

  def start
    puts "Welcome to the Fantasical Wonderful Flash Card Game! You're playing with #{deck.cards.length} cards."
    puts "-------------------------------------------------"
    puts "This is card number #{turns.count + 1} out of 4"
    puts "Question: #{current_card.question}"
    take_turn
    puts "This is card number #{turns.count + 1} out of 4"
    puts "Question: #{current_card.question}"
    take_turn
    puts "This is card number #{turns.count + 1} out of 4"
    puts "Question: #{current_card.question}"
    take_turn
    puts "This is card number #{turns.count + 1} out of 4"
    puts "Question: #{current_card.question}"
    take_turn
    puts "****** Game over! ******"
  end

end
