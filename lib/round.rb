
class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
   new_turn = Turn.new(guess, current_card)
   @turns << new_turn
   @turns.last
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(in_category)
    @turns.count do |turn|
    turn.correct? and (turn.card.category == in_category)
  end
 end

  def percent_correct
    100 * (number_correct.to_f / turns.count.to_f)
  end

  def percent_correct_by_category(cat)
    x = @turns.count do |turn|
      (turn.card.category == cat)
    end
    y = @turns.count do |turn|
      turn.correct? and (turn.card.category == cat)
    end
    100.0 * (y.to_f / x.to_f)
  end

  def start
    puts    "Welcome! You're playing with #{@deck.count} cards.\n
-------------------------------------------------"

    until turns.count == @deck.count
    puts "This is card number #{turns.count+1} out of #{@deck.count}"
    puts "Question: #{current_card.question}"
    user_guess = gets.chomp
    turn = Turn.new(user_guess, @cards)

    user_guess == current_card.answer
    take_turn(user_guess)
    puts turns.last.feedback
 end

 puts "****** Game over! ******"
 puts "You had #{number_correct} correct guesses out of 4 for a total score of #{percent_correct}%."
 puts "Catogory statistics:"

 game_categories = deck.cards.map do |game_category|
   game_category.category
 end.uniq

 game_categories.map do |category|
   puts "#{category} - #{percent_correct_by_category(category).to_i} % correct"
 end
 end
end
