class Round

  attr_reader :deck, :turns, :cur_card, :turn_taken

  def initialize(deck)
    @deck = deck
    @turns = []
    @cur_card = nil
    @turns_taken = 0
  end

  def count
  end

  def current_card
    @cur_card = @deck.shift
    return @cur_card
  end

  def take_turn(guess)
    @turns = Turn.new(guess, @cur_card)
    @turns_taken += 1
    return @turns
  end

end
