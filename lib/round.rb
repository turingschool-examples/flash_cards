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
    @deck.cards.rotate!(1)
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.card.answer == turn.guess
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end
  end

  def percent_correct
    count = @turns.count
    number_correct.to_f / count * 100
  end

  def percent_correct_by_category(category)
    turns_by_category = []
    @turns.each do |turn|
      if turn.card.category == category
        turns_by_category << turn
      end
    end
    number_correct_by_category(category).to_f / turns_by_category.count * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    turns = 0
    until turns == deck.count do
      turns += 1
      puts "This is card number #{turns} out of #{deck.count}."
      puts current_card.question
      user_input = gets.chomp
      turn = take_turn(user_input)
      puts turn.feedback
    end
      puts "****** Game over! ******"
  end

  def turns_by_category
    categories = []
    @deck.cards.count do |card|
      card.category
      categories << card.category
    end
    categories.uniq
  end

  def game_end_stats
    puts "You had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct.round(0)}%."
    categories = turns_by_category
    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).round(0)}% correct"
    end
  end
end
