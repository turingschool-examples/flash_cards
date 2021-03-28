  require './lib/card'

class Turn
    attr_reader :guess,
                :card
    def initialize(string, card)
      @guess = string
      @card = card
    end

    def correct?
      @guess == card.answer
    end

  def feedback
    if @guess == card.answer
      puts "Correct!"
      return "Correct!"
    else
      puts "Incorrect."
      return "Incorrect."
    end
  end
end
