class Round

  attr_reader :deck, :turns #:correct
  def initialize(deck)
    @deck = deck
    @turns = []
    # @correct = 0
  end
end
