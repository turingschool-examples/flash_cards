class Turn
  attr_reader :string, :card, :guess
  def initialize(string, card)
    @string = string
    @card = card
    @guess = "Juneau"
  end

end
