require_relative 'card'
require_relative 'deck'
require_relative 'turn'

Class round

  attr_reader :deck

  def initialize(deck)
    @deck = Deck
  end

end
