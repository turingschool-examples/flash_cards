class Turn < Card

    attr_reader :guess

    def initialize(guess)
      @guess = guess
    end

  def guess guess
    puts guess
    guessed = guess
  end

  def correct?
    guessed = guess
    if guessed == "Tungsten"
      puts "true"
    else
      puts "false"
    end
  end



end#end class

turn1 = Turn.new ("")
puts "Please enter a guess..."
turn1.guess(gets.chomp) #user enters a guess
turn1.correct?(guessed)
