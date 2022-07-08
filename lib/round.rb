require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
#require './flashcard_runner.rb'

class Round
  attr_reader :turns, :number_correct, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
  end
  #
  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
    @turns << turn

    if turn.correct? == true
      @correct_turns << turn
    end
    turn
  end

  def number_correct
    @correct_turns.count
  end

  def number_correct_by_category(category)
    @correct_turns.count do |turn|
      turn.card.category == category
    end
  end


  def percent_correct
    (@correct_turns.count.to_f/@turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    correct = @correct_turns.count do |turn|
                turn.card.category == category
              end

    total = @turns.count do |turn|
                turn.card.category == category
              end

    correct = correct.to_f

    (correct/total) * 100
  end

  def unique_category
    #returns an array of the unique categories in the deck
    categories = []
    @deck.cards.each do |card|
      categories << card.category
    end

    categories.uniq

  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards"
    puts "_______________________________________________________"

    @deck.count.times do
      puts "This is card number #{@turns.count + 1} of #{@deck.count}"
      puts "Question: #{current_card.question}"

      guess = gets.chomp
      new_turn = take_turn(guess)
      puts new_turn.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct out of #{@deck.count} for at total score of #{percent_correct}%."

    unique_category.each do |c|
      puts "#{c} - #{percent_correct_by_category(c)}% correct"

    end
  end
end
