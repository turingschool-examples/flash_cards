class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turn = Turn.new(guess, current_card)
    @turns << @turn
    @deck.cards.rotate!
    @turn
    #change the current card to the next card in the deck
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end


end
