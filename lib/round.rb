class Round
  attr_reader :the_deck, :turns

  def initialize(the_deck)
    @the_deck = the_deck
    @turns = []
  end
end
