class Round
  attr_reader :round
              :turns
              :take_turn

  def initialize(round)
    @round = round
    # @turns = []
  end

  def turns
    @turns = []
  end

  def take_turn
    @take_turn = true
  end

  def new_turn

  end
end
