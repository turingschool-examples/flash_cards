class Round

attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def correct?
    @guess == card.answer
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def percent_correct
    (number_correct.to_f/@turns.length) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f/@turns.length) * 100
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
  end

  def start
    puts "Welcome, you're playing with 3 cards."
    puts "-------------------------------------------------"
    puts "This is card number 1 out of 3."
    until @deck.cards == [] do
      puts current_card.question
      guess = gets.chomp
      take_turn(guess)
      puts @turns.last.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@turns.length} for a total of score of #{percent_correct.round}%."
    turn_categories = @turns.uniq do |turn|
      turn.card.category
    end
    turn_categories.each do |turn|
      category = turn.card.category
      puts "#{category} - #{percent_correct_by_category(category).round}% correct"
    end
  end
end
