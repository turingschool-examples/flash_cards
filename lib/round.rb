class Round
  attr_reader :deck,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def start
    turn_count = 1
    deck_count = deck.count

    puts "Welcome! You're playing with #{deck_count} cards."
    puts "-------------------------------------------------"

    until deck.count == 0
      puts "This is card number #{turn_count} out of #{deck_count}"
      puts "Question: #{current_card.question}"
      player_guess = gets.chomp.downcase
      take_turn(player_guess)
      puts @turns.last.feedback
      turn_count += 1
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck_count} for a total score of #{percent_correct.round}%."
    puts "Fruit and Vegetable - #{percent_correct_by_category("Fruit and Vegetable").round}% correct"
    puts "Snack Foods - #{percent_correct_by_category("Snack Foods").round}% correct"
    puts "Cooking Methods - #{percent_correct_by_category("Cooking Methods").round}% correct"
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn

    if turn.correct?
      @number_correct += 1
    end
    @deck.cards.shift
    turn
  end

  def number_correct_by_category(category)
    number_correct = 0
    turns.each do |turn|
      if category == turn.card.category && turn.correct?
        number_correct += 1
      end
    end
    number_correct
  end

  def percent_correct
    (@number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)

    number_correct = number_correct_by_category(category)
    turns_in_category = 0

    turns.each do |turn|
      if category == turn.card.category
        turns_in_category += 1
      end
    end
    (number_correct.to_f / turns_in_category) * 100
  end

end
