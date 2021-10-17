require './lib/card'
require './lib/turn'
require './lib/deck'



class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    if @turns.count == 0
      return deck.cards[0]
    elsif @turns.count == 1
      return deck.cards[1]
    elsif @turns.count == 2
      return deck.cards[2]
    else
    end
  end



  def take_turn(guess)
    if guess == "Juneau"
      new_turn = Turn.new(guess, deck.cards[0])
    elsif guess == "Venus"
      new_turn = Turn.new(guess, deck.cards[1])
    elsif guess == "North north west"
      new_turn = Turn.new(guess, deck.cards[2])
    else
    end
      @turns << new_turn
      return new_turn
  end

  def number_correct
    number_correct = []
    @turns.each do |turn|
      if turn.feedback.include?("Correct!")
        number_correct << turn
      end
    end
    return number_correct.count
  end


  def number_correct_by_category(category)
    correct_by_cat = []

    @turns.each do |turn|
      if turn.feedback.include?("Correct!") && turn.card.category == category # and if the
        correct_by_cat << turn
      end
      return correct_by_cat.count
    end
  end

  def percent_correct
    number_correct = []
    number_incorrect = []
    @turns.each do |turn|
      if turn.feedback.include?("Correct!")
        number_correct << turn
      else
        number_incorrect << turn
      end
    end
    x = number_correct.count.to_f
    y = number_correct.count.to_f + number_incorrect.count.to_f
    fraction = x / y
    100 * fraction

    # require 'pry';binding.pry
  end

  def percent_correct_by_category(category)
    cat_correct = []
    cat_incorrect = []
      # require 'pry';binding.pry
    @turns.each do |turn|
      if turn.feedback.include?("Correct!") && turn.card.category == category
        cat_correct << turn
      else
        cat_incorrect << turn
      end

      x = cat_correct.count.to_f
      y = cat_incorrect.count.to_f + cat_correct.count.to_f
      fraction = x / y
      return 100 * fraction
    end
  end
end
# require 'pry';binding.pry
