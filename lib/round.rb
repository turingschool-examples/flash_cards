class Round
  attr_reader :deck, :turns, :number_correct, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    deck.cards = deck.cards.rotate
    @current_card = @deck.cards[0]
    turns.last
  end

  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end


  def number_correct_by_category(category)
    turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
  end
end
