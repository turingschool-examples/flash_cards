require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :answer, :question, :cards
  #attr_accessor :turn

  def initialize(deck_parameter)
    @deck = deck_parameter
    @turns = []
  end

def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess_parameter)
    @guess = guess_parameter
    new_turn = Turn.new(@guess, current_card)
    @turns << new_turn
  end

  def number_correct
    @number_correct = @turns.inject(0) do |count, turn|
    turn.correct? ? count += 1 : count
     end
  end

  def turns_last_feedback
    if @guess == turns.last.answer
      p "Correct!"
    else p "Incorrect!"
    end
  end

  def number_correct_by_category(category)
    @category = (category)
    @turns.inject(0) do |count, turn|
       turn.correct? && turn.card.category == @category ? count += 1 : count
     end
  end

  def percent_correct
    @number_correct = @turns.inject(0) do |count, turn|
    turn.correct? ? count += 1 : count
     end
    @number_correct / turns.count.to_f * 100
  end

  def percent_correct_by_category(category)
    @category = (category)

    @number_correct = @turns.inject(0) do |count, turn|
    turn.correct? && turn.card.category == @category ? count += 1 : count
    end

    @category_count = @turns.count do |turn|
      turn.card.category == @category
    end

    @number_correct / @category_count.to_f * 100
    end

    def start
      print "Welcome! You're playing with "
      print deck.cards.count
      print " cards.\n"
      puts "-------------------------------------"
      print "This is card number 1 out of "
      print deck.cards.count
      print ".\n"
      puts "Question:"
      print deck.cards[0].question
      print ".\n"
    end
  end
