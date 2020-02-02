class Round
  attr_reader :deck, :turns_completed
  def initialize(deck)
    @deck = deck
    @turns_completed = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns_completed << Turn.new(guess, self.current_card)
    @deck.cards.shift
    @turns_completed[-1]
  end

  def number_correct
    @turns_completed.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns_completed.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    (number_correct.to_f/turns_completed.length) * 100
  end

  def percent_correct_by_category(category)
    cards_of_same_category = []
    @turns_completed.each { |turn| cards_of_same_category << turn if turn.card.category == category }
    (number_correct_by_category(category).to_f/cards_of_same_category.length) * 100
  end

  def start
    turns_count = 1
    categories = []
    puts "Welcome! You're playing with #{@deck.count} cards"
    puts '-------------------------------------------------'
    until @deck.cards.length == 0
      puts "This is card number #{turns_count} out of #{@deck.count + @turns_completed.count}."
      puts @deck.cards[0].question
      take_turn(gets.chomp)

      @turns_completed[-1].feedback
      categories << @turns_completed[-1].card.category
      turns_count += 1
    end
    puts '****** Game over! ******'
    puts "You had #{number_correct} correct guesses out of #{@turns_completed.length} for a total score of #{percent_correct.to_i}%."
    categories.uniq.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).to_i}% correct"
    end
  end
end
