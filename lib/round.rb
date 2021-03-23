require 'turn'

class Round
  attr_reader :deck, :current_card, :number_correct, :turns

  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards.first
    @current_card_index = 0
    @turns = []
    @number_correct = 0
    @number_correct_categories = {}
  end

  def take_turn(guess)

    return nil if @current_card == nil

    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn

    guess_is_correct = new_turn.correct?

    @number_correct = @number_correct + 1 if guess_is_correct
    category = @current_card.category

    if @number_correct_categories[category] != nil
      new_num = @number_correct_categories[category] + 1
      @number_correct_categories[category] = new_num if guess_is_correct
    else
      @number_correct_categories[category] = 1 if guess_is_correct
      @number_correct_categories[category] = 0 if not guess_is_correct
    end

    @current_card_index = @current_card_index + 1
    @current_card = @deck.cards[@current_card_index]

    return new_turn
  end

  def number_correct_by_category(category)
    @number_correct_categories[category]
  end

  def percent_correct
    (@number_correct / @deck.count.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    correct_num = @number_correct_categories[category]
    total_cards = @deck.cards_in_category(category).length.to_f

    (correct_num / total_cards) * 100.0
  end

end
