class Round
  attr_reader :deck,
              :turns

  def initialize (deck_parameter)
    @deck = deck_parameter
    @turns = []
  end
end
