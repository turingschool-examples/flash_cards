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
    @turns << Turn.new(guess, @deck.cards[0])
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    @turns.count {|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.correct? && turn.card.category == category}
  end

  def percent_correct
  100 * (self.number_correct / @turns.count.to_f)
  end

  def percent_correct_by_category(category)
  100 * self.number_correct_by_category(category) / @turns.count {|turn| turn.card.category == category}
  end

  def turns_remaining
    @deck.cards.length - @turns.length
  end

  def total_cards
    @deck.count
  end

  def start
    puts "Welcome! You're playing with #{self.total_cards} cards."
    puts "------------------------------------------------------------"
    while self.turns_remaining > 0 do
      puts "This is card number #{self.turns_remaining} out of #{self.total_cards}"
      puts "Question: #{self.current_card.question}"
      self.take_turn(gets.chomp)
      puts self.turns.last.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{self.number_correct} correct guesses out of #{self.total_cards} for a total score of #{self.percent_correct}%."
    list_of_categories = []
    self.deck.cards.each do |card|
      list_of_categories << card.category
      end
      list_of_categories.uniq.each do |category|
        puts "#{category} - #{self.percent_correct_by_category(category)}% correct"
      end
  end

end
