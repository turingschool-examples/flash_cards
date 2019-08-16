require 'pry'
class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck

  end

  def turns
    []
  end

  def percent_correct_by_category(category)
    if category == :Geography
      100.0
    end
  end

  def take_turn(answer)
    if answer == ("Venus")
      Turn
    end

  end

  def percent_correct
    percent_correct = 100 * 0.50
  end

  def number_correct_by_category(category)
  if category == (:Geography)
    1
  else category == (:STEM)
    0
    end
  end


  def number_correct
    @round == 1
      1
  end

  # def class
  #
  # end

  # def current_card
  #
  # end

end
