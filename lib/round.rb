class Round
  attr_reader :deck, :turns, :correct, :correct_by_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @right_answer = []
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn

    if @new_turn.correct?
      @right_answer << current_card
    end

    @new_turn
  end

  def number_correct
    @right_answer.count
  end

  def number_correct_by_category(category)
    @right_answer.map { |card| card.category }.count
  end

  def percent_correct
    require "pry"

    binding.pry
  end
end
