class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    num = @turns.count
    deck.cards[num]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @number_correct += 1 if new_turn.correct?
    new_turn
  end

  def number_correct_by_category(category)
    arr_by_category = []
    @turns.each do |turn|
      if category == turn.card.category && turn.correct?
        arr_by_category << turn.card
      end
    end
    arr_by_category.count
  end


end
