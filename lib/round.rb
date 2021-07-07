class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @current_card)
    @deck.cards.shift
    current_card

    @turns.last
  end

  def number_correct
    correct = 0

    @turns.each do |turn|
      if turn.card.answer == turn.guess
        correct += 1
      end
    end
    correct
  end
end