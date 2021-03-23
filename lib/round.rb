require 'turn'

class Round
  attr_reader :deck, :current_card, :number_correct, :turns

  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards.first
    @current_card_index = 0
    @turns = []
    @number_correct = 0
    @number_correct_in_category = {}
  end

  def take_turn(guess)

    return nil if @current_card == nil

    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn

    guess_is_correct = new_turn.correct?

    @number_correct = @number_correct + 1 if guess_is_correct

    if @number_correct_in_category[@current_card.category] != nil
      new_num = @number_correct_in_category[@current_card.category] + 1
      @number_correct_in_category[@current_card.category] = new_num if guess_is_correct
    else
      @number_correct_in_category[@current_card.category] = 1 if guess_is_correct
      @number_correct_in_category[@current_card.category] = 0 if not guess_is_correct
    end

    @current_card_index = @current_card_index + 1
    @current_card = @deck.cards[@current_card_index]

    return new_turn
  end

  def number_correct_by_category(category)
    @number_correct_in_category[category]
  end

  def percent_correct
    (@number_correct / @deck.count.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    (@number_correct_in_category[category] / @deck.cards_in_category(category).length.to_f) * 100.0
  end

end
