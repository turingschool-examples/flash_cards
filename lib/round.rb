class Round
attr_reader :deck, :turns, :number_correct

  def initialize(deck, turns = [])
    @deck = deck
    @turns = turns
    @number_correct = 0
  end

  def take_turn(guess)
    turn_test = Turn.new(guess,current_card)
    if turn_test.correct?
      @number_correct += 1
    end
      @turns << turn_test
      turn_test
  end

  def current_card
    deck.cards[@turns.count]
  end

  def number_correct_by_category(category)
     @turns.find_all {|turn| turn.correct? && turn.card.category == category}.count
  end

  def percent_correct
    (@number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / @turns.find_all {|turn| turn.card.category == category}.count.to_f) * 100
  end

  def start

    puts "Welcome! You're playing with #{@deck.count} cards.\n
-----------------------------------------------------------"

    until turns.count == @deck.count
    puts "This is card number #{turns.count + 1} out of #{@deck.count}.\n
    Question: #{current_card.question}"
    user_guess = gets.chomp
    turn = Turn.new(user_guess, @cards)

    user_guess == current_card.answer
    take_turn(user_guess)
    puts turns.last.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{number_correct} guesses out of #{@deck.count} for a total of #{percent_correct.round(0)}%."
  puts "Category Statistics:"

  game_categories = deck.cards.map do |game_category|
    game_category.category
  end.uniq

  game_categories.map do |category|
    puts "#{category} - #{percent_correct_by_category(category).to_i} % correct"
  end
  end
end
