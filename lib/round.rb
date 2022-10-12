require './lib/deck'

class Round

  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @curr_card_idx = 0
    @current_card = @deck.cards[curr_card_idx]
    @turns = []
    number_correct = {total: 0}
  end

  def take_turn(guess)
    turns << Turn.new(guess, @current_card)
    if turns[@curr_card_idx].correct?
      number_correct[:total] += 1
      number_correct[@current_card.category] += 1
    end
    update_card
  end

  def update_card
    @curr_card_idx += 1
    @current_card = @deck.cards[curr_card_idx]
  end

  def number_correct
    number_correct[:total]
  end

  def number_correct_by_category(type)
    number_correct[type]
  end
end
