class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card

  end

  def correct?

    if @guess == card.answer
      then true
    else false
    end

  end

  def feedback

    if @guess == card.answer
      then
      "Correct!"
    else
      "Incorrect."
    end

  end





end

# require './card'

# card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

# turn = Turn.new("Juneau", card)



##why do p and puts output different things here?