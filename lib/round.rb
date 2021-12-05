class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    ((number_correct * 100) / turns.length).to_f
  end

  def turns_per_cat(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_per_cat(category).to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    until deck.cards.empty? do
      puts "This is card number #{turns.length + 1} out of #{deck.cards.count + turns.length}."
      puts "#{current_card.question}"
      guess = gets.chomp
      puts take_turn(guess).feedback
      puts "-" * 25
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count + turns.length} for a total score of #{percent_correct}%"
    puts "STEM -- #{percent_correct_by_category(:STEM)}% correct"
    puts "Pop Culture -- #{percent_correct_by_category(:Culture)}% correct"
    puts "Geography -- #{percent_correct_by_category(:Geography)}% correct"
  end
end
