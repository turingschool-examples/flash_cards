class Round
  attr_reader :turns, :class
  attr_accessor :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
   @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
     deck.cards.rotate!
     turn
  end

  def number_correct
    @turns.each do |turn|
      if turn.guess == turn.card.answer
     @number_correct += 1
      end
    end
    @number_correct
  end

  def number_correct_by_category(category)
    @number_correct_by_category = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.guess == turn.card.answer
      @number_correct_by_category += 1
      end
    end
    @number_correct_by_category
  end

  def percent_correct
    @number_correct.to_f / @turns.count.to_f * 100
  end

  def percent_correct_by_category(category)
      (number_correct_by_category(category) / @deck.cards_in_category(category).count.to_f) * 100

  end

  def start
    puts "Welcome! You're playing with 4 cards."
    -------------------------------------------------
    i= 0
    until i == deck.count
        i += 1
    puts "This is card number #{i} out of #{deck.count}"
    puts "Question: #{current_card.question}"
    user_guess = gets.chomp.capitalize
    puts take_turn(user_guess).feedback
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of 4 for a total score of #{percent_correct.to_i}%."
    puts "Reactive Nonmetals - #{percent_correct_by_category(:ReactiveNonmetals).to_i}% correct"
    puts "Noble Gases - #{percent_correct_by_category(:NobleGases).to_i}% correct"
    puts "Metalloids - #{percent_correct_by_category(:Metalloids).to_i}% correct"
    end
  end
