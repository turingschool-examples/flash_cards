class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0

  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
      new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @deck.cards.rotate!
      if new_turn.correct?
        @number_correct += 1
      end
    return new_turn
  end

  def total_correct_answers
    total_correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        total_correct += 1
      end
    end
    total_correct
  end

  def number_correct_by_category(category)
    number_of_correct_by_category = 0
    @turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
        number_of_correct_by_category += 1
      end
    end
    number_of_correct_by_category
  end

  def percent_correct
    (self.total_correct_answers / @turns.length) * 100.0
  end

  def percent_correct_by_category(category)
    100 * (self.number_correct_by_category(category).to_f / @deck.cards_in_category(category).length)
  end

  def start
    puts "Welcome! You're playing with #{self.deck.cards.length} cards."
    puts "-------------------------------------------------"
    while self.turns.length < self.deck.cards.length do
      puts "This is card number #{self.turns.length + 1} out of #{self.deck.cards.length}."
      puts "Question: #{self.current_card.question}"
      puts self.take_turn(gets.chomp).feedback
    end

    puts "****** Game over! ******"
    puts "You had #{self.total_correct_answers.to_i} correct guesses out of #{self.deck.cards.length} for a total score of #{self.percent_correct.to_i}%."

    categories =[]
      self.deck.cards.each do |card|
        categories << card.category
      end
    categories.uniq!

    categories.each do |category|
      puts "#{category} -  #{self.percent_correct_by_category(category).to_i}% correct"
    end
  end
end
