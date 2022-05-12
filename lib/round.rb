class Round

  attr_reader :deck, :turns, :correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    if guess == current_card.answer
      @correct += 1
    end
    @turns << Turn.new(guess, current_card)
    @deck.cards = @deck.cards.rotate(1)
    @turns.last
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    correct_count = 0
    @turns.each do |turn|
      if turn.card.answer == turn.guess && turn.card.category == category
        correct_count += 1
      end
    end
    correct_count
  end

  def percent_correct
    (number_correct.to_f / @turns.length * 100)
  end

  def percent_correct_by_category(category)
    category_total = turns.select do |turn|
      turn.card.category == category
    end.length
    (number_correct_by_category(category).to_f / category_total) * 100
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"
    until @turns.length == deck.count do
      puts "This is card number #{@turns.length + 1} out of #{deck.count}"
      puts "Question: #{current_card.question}"
      guess = gets.chomp
      (take_turn(guess))
      puts turns.last.feedback
    end
  end
end
