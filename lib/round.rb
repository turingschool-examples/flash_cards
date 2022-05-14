class Round

  @@rounds = Set.new

  def initialize(deck)
    @deck = deck

    @@rounds << self
  end
end
