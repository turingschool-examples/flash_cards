class Deck
  @cards_stack = Card.new
  attr_reader

  def self.all_instances
    @cards_stack
  end

  def initialize
    @cards_stack << self
  end

  def cards
    return ["#{@cards_stack}"]
  end
end
