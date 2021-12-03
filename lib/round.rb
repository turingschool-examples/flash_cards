class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    @number_correct += 1 if guess == current_card.answer
    @turns << Turn.new(guess, deck.cards.shift)
    @turns.last
  end

  def percent_correct
    ((@number_correct.to_f / (@deck.cards.size + @turns.count)) * 100).to_i
  end
end
