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
    elsif @turns.count == 3
      return deck.cards [3]
    else
    end
  end

  def take_turn(guess)
    if @turns.count == 0
      new_turn = Turn.new(guess, deck.cards[0])
    elsif @turns.count == 1
      new_turn = Turn.new(guess, deck.cards[1])
    elsif @turns.count == 2
      new_turn = Turn.new(guess, deck.cards[2])
    elsif @turns.count == 3
      new_turn = Turn.new(guess, deck.cards[3])
    end
      @turns << new_turn
      return @turns.last
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
      if turn.feedback.include?("Correct!") && turn.card.category == category
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

  end

  def percent_correct_by_category(category)
    cat_correct = []
    cat_incorrect = []
    @turns.each do |turn|
      if turn.feedback.include?("Correct!") && turn.card.category == category
        cat_correct << turn
      elsif turn.feedback.include?("Correct!") && turn.card.category != category
        cat_correct << turn
      elsif turn.feedback.include?("Incorrect.") && turn.card.category == category
        cat_incorrect << turn
      elsif turn.feedback.include?("Incorrect.") && turn.card.category !=
        cat_incorrect << turn
      else
      end

      x = cat_correct.count.to_f
      y = cat_incorrect.count.to_f + cat_correct.count.to_f
      fraction = x / y
      return 100 * fraction
    end
  end
end
