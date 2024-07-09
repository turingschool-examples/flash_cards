require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck 
    @turns = []
    @current_card_index = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@current_card_index]
  end
  
  def take_turn(guess)
    current_card = self.current_card
    turn = Turn.new(guess, current_card)
   @turns << turn
   @current_card_index += 1
   if turn.correct?
    @number_correct += 1 
   end
   turn
  end

  def number_correct
    @number_correct
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    (@number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    correct_in_category = @turns.count {|turn| turn.card.category == category && turn.correct?}
    total_in_category = @turns.count {|turn| turn.card.category == category}
    (correct_in_category.to_f / total_in_category) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.count} cards"
    puts "-------------------------------------------------"

    deck.cards.each_with_index do |card, index|
      puts "This is card number #{index + 1} outof #{deck.cards.count}."
      puts "Question: #{card.question}"
      guess = gets.chomp
      turn = take_turn(guess)
      puts turn.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct.round(2)}%."

    categories = []
    deck.cards.each do |card|
      categories << card.category unless categories.include?(card.category)
    end

    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).round(2)}% correct"
    end
  end
end