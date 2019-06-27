
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

  def correct?
    if @guess == card.answer
       true
     else
      false
   end
end

  def feedback
    if @guess ==  card.answer
      "Correct!"
    else
      "Incorrect!"
    end
  end

end#end class


=begin multilinecomment
card1 = Card.new("what is the element W?", "Tungsten", :science) #creates new card
--to test fail answer
turn1 = Turn.new("Helium", card1)
--to test correct answer
turn1 = Turn.new("Tungsten", card1)
turn1.card
turn1.guess
turn1.correct?
turn1.feedback
=end
