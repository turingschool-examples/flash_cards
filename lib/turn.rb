class Turn

    attr_reader :guess, :card

    def initialize(guess, card)
      @guess = guess
      @card = card
    end
=begin multilinecomment
    def card
      puts @card
    end

  def guess guess
    puts "#{question}"
    guess = gets.chomp
  end
=end


  def correct? guess
    if guess == @answer
      return true
    else
      return false
  end

  def feedback guess
    if guess == @answer
      puts "Correct!"
    else
      puts "Inorrect!"
    end
  end



end#end class
=begin multilinecomment
card1 = Card.new("what is the element W?", "Tungsten", :science) #creates new card
turn1 = Turn.new("Tungsten", card1)
turn1.card
turn1.guess
turn1.correct?
turn1.feedback
=end
