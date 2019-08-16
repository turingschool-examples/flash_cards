require 'pry'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.find do |card|
      card
    # @deck.cards.rotate.find do |card|
    #   card
    #   #rotate function
    # end
    #
    #  # binding.pry
    end
  end

  def go_to_next_card
    @deck.cards.shift
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns.push new_turn
    new_turn
  end
  # binding.pry


  def number_correct
  #   @turns.correct?
  # end
    # new = []
    new = @turns.find_all do |turn|
      turn.correct?
      # turn.card.answer == turn.guess
      # new << turn
      # binding.pry
    end
    new.length
    # @turns.find_all {|turn| turn.correct?}.length
  end

  def test_number_correct_by_category(category)
    @turns.find_all do |turn|
      turn == category
    end 

  end

end
