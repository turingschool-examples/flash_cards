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
    (number_correct.to_f/turns.length) * 100
  end

  def percent_correct_by_category(category)
    cards_of_same_category = []
    @turns.each { |turn| cards_of_same_category << turn if turn.card.category == category }
    (number_correct_by_category(category).to_f/cards_of_same_category.length) * 100
  end

  def start
    turns_count = 1
    categories = []
    puts "Welcome! You're playing with #{@deck.count} cards"
    puts '-------------------------------------------------'
    until @deck.cards.length == 0
      puts "This is card number #{turns_count} out of #{@deck.count + @turns.count}."
      puts @deck.cards[0].question
      take_turn(gets.chomp)

      @turns[-1].feedback
      categories << @turns[-1].card.category
      turns_count += 1
    end
    puts '****** Game over! ******'
    if number_correct == 1
      puts "You had #{number_correct} correct guess out of #{@turns.length} for a total score of #{percent_correct.to_i}%."
    else
      puts "You had #{number_correct} correct guesses out of #{@turns.length} for a total score of #{percent_correct.to_i}%."
    end
    categories.uniq.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).to_i}% correct"
    end
  end
end
