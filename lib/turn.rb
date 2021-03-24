

class Turn
    attr_reader :guess,
                :card
    def initialize(string, card)
      @guess = string
      @card = card
    end

    def correct?
    require './card'
      if @guess == card.answer
        return true
      else
        return false
      end
    end

  def feedback
    require './card'
    if @guess == card.answer
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end
