class Round

  attr_reader :deck,
              :turns,
              :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    turns_taken = @turns.length
    @deck.cards[turns_taken]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, self.current_card)
    turns << new_turn
    if new_turn.correct? == true
      @number_correct += 1
    end
    puts new_turn.feedback
    return new_turn
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    # 49.times do
    #   print "-"
    # end
    puts "-------------------------------------------------"
    rounds = deck.count
    while rounds > 0 do
      puts "This is card number #{turns.length + 1} out of #{deck.count}."
      puts "Question: #{self.current_card.question}"
      self.take_turn(gets.chomp)
      rounds -= 1
    end
    self.game_summary
  end

  def game_summary
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{deck.count} for a total score of #{self.percent_correct.round}%"
    self.list_categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).round}% correct"
    end
  end

  def list_categories
    category_list = []
    deck.cards.each do |card|
      if category_list.include?(card.category) == false
        category_list << card.category
      end
    end
    return category_list
  end

  def number_correct_by_category(category)
    total_for_category = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        total_for_category += 1
      end
    end
    return total_for_category
  end

  def percent_correct
    if @turns.length > 0
      ( @number_correct / @turns.length.to_f ) * 100.0
    else
      "No turns have yet been taken."
    end
  end

  def percent_correct_by_category(category)
    # num correct for category divided by num turns in category
    turns_in_category = 0
    @turns.each do |turn|
      if turn.card.category == category
        turns_in_category += 1
      end
    end
    correct_in_category = self.number_correct_by_category(category)
    if turns_in_category > 0.0
      (correct_in_category / turns_in_category.to_f ) * 100.0
    else
      "No turns in this category have yet been taken."
    end
  end
end
