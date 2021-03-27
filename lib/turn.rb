

class Turn
    attr_reader :guess,
                :card
    def initialize(string, card)
      @guess = string
      @card = card
    end

    def correct?
    require './card'
      @guess == card.answer
    end

  def feedback
    require './card'
    if @guess == card.answer
      puts "Correct!"
      return "Correct!"
    else
      puts "Incorrect."
      return "Incorrect."
    end
  end
end
