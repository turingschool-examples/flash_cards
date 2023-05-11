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
    new_turn = Turn.new(guess, @deck.cards.first)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.select { |turn| turn.correct? }.count
  end

  def number_correct_by_category(category)
    @turns.select { |turn| turn.correct? && turn.card.category == category }.count  
  end

  def percent_correct_by_category(category)
    number_correct = @turns.select { |turn| turn.correct? && turn.card.category == category }.count
    number_in_category = @turns.select { |turn| turn.card.category == category }.count
    (number_correct / number_in_category.to_f) * 100
  end

  def overall_correct_percent
    ((number_correct.to_f / @turns.count) * 100).round(2).to_s + "%"
  end

  def start
    puts ""
    puts "Welcome to flashcards!"
    puts "You're playing with 4 cards."
    puts "-------------------------------------------------"
    puts "This is card number 1 out of 4."
    puts "Question: #{@deck.cards.first.question}"
    user_answer = gets.chomp
    new_turn = take_turn(user_answer)
    p new_turn.feedback
    round(2)
  end

  def round(number)
    if number > 4
      game_over
    else
      puts ""
      puts "Welcome to round #{number}!"
      puts "You're playing with 4 cards."
      puts "-------------------------------------------------"
      puts "This is card number #{number} out of 4."
      puts "Question: #{@deck.cards.first.question}"
      user_answer = gets.chomp
      new_turn = take_turn(user_answer)
      p new_turn.feedback
      round(number + 1)
    end
  end

# if else statement for puts guess vs. guesses based on guesses

  def game_over
    puts ""
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@turns.count} for a total score of #{overall_correct_percent}."
    puts "Geography - #{percent_correct_by_category(:Geography)} correct"
    puts "STEM - #{percent_correct_by_category(:STEM)} correct"
    puts "Pets - #{percent_correct_by_category(:Pets)} correct"
  end
end