class Round
  attr_reader :deck, :turns, :card_number, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_number = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[card_number]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @card_number += 1
    if new_turn.correct?
      @number_correct += 1
    end
    new_turn
  end

  def number_correct_by_category(category)
    correct_in_category = 0
    turns.each do |turn|
      if turn.card.category == category && turn.correct?
        correct_in_category += 1
      end
    end
    correct_in_category
  end

  def percent_correct

end
