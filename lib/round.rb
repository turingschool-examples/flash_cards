class Round
  attr_reader :deck, :turns, :correct_cards, :incorrect_cards, :category_array
  def initialize(deck)
    @deck = deck
    @turns = []
    @category_array = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, self.current_card)
    @deck.cards.shift
    @turns[-1]
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    (number_correct.to_f/turns.length) * 100.0
  end

  def percent_correct_by_category(category)
    @category_array = []
    @turns.each { |turn| @category_array << turn if turn.card.category == category }
    (number_correct_by_category(category).to_f/category_array.length) * 100.0
  end

  def start
    turns_count = 1
    puts "Welcome! You're playing with #{@deck.count} cards"
    puts '-------------------------------------------------'
    until @deck.cards.length == 0
      puts "This is card number #{turns_count} out of #{@deck.count + @turns.count}."
      puts @deck.cards[0].question
      take_turn(gets.chomp)

      @turns[-1].feedback
      @category_array << @turns[-1].card.category
      turns_count += 1
    end
    puts '****** Game over! ******'
    puts "You had #{number_correct} correct guesses out of #{@turns.length} for a total score of #{self.percent_correct.to_i}%."
    @category_array.uniq.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).to_i}% correct"
    end
  end
end
