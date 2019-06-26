class Deck
  attr_reader :cards_stack

  def initialize(cards_stack)
    @cards_stack = []
  end

  def show_deck
    return ["#{@cards_stack}"]
  end

end
