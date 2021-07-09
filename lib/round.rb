class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    deck.cards.shift
    turns.last
  end

  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    (number_correct.to_f / turns.length.to_f) * 100
  end

  def turns_per_category(category)
    turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_per_category(category).to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.count} cards."
    puts "-------------------------------------------------"
    while deck.cards.length > 0 do
      card = deck.cards.last
      puts "This is card number #{turns.length + 1} out of #{(deck.cards.count + turns.length)}."
      puts "Question: #{current_card.question}"
      guess = gets.chomp
      puts take_turn(guess.downcase.delete "!.?").feedback
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{turns.length} for a total score of #{percent_correct}."
    percentage_array = turns.map do |turn|
      "#{turn.card.category} - #{percent_correct_by_category(turn.card.category)}%"
    end
    puts percentage_array.uniq
  end
end
