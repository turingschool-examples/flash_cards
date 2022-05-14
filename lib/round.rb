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
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    correct
  end

  def number_correct_by_category(category)
    correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        correct += 1
      end
    end
    correct
  end

  def cards_by_category(category)
    correct = 0
    @turns.each do |turn|
      if  turn.card.category == category
        correct += 1
      end
    end

    correct
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100

  end

    def percent_correct_by_category(category)
      (number_correct_by_category(category) / cards_by_category(category).to_f) * 100


  end

  def start
    # require 'pry'; binding.pry
    puts "Welcome! You're playing with #{@deck.cards.count} cards."
    puts "-------------------------------------------------"
    @deck.cards.count.times do
    puts "This is card number #{@turns.count + 1} of #{@deck.cards.count}"
    puts "Question: #{current_card.question}"

    guess = gets.chomp

    new_turn = take_turn(guess)
    puts new_turn.feedback
  end
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{turns.count} for a total score of #{percent_correct}."

    

  end








end
