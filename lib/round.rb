class Round

  attr_reader :deck, :turns
  attr_accessor :number_correct, :count, :total_cards, :cats

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @count = 1
    @total_cards = 0
    @cats = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(turn_guess, card = @deck.cards[0])
    @deck.cards.shift
    @count += 1
    next_turn = Turn.new(turn_guess, card)
    @turns << next_turn
    if @turns.last.correct?
      @number_correct += 1
    end
    next_turn
  end
  
  def number_correct
    @number_correct
  end

end