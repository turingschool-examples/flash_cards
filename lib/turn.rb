
class Turn
  attr_reader :card


  def guess
    p question
    ans = gets.chomp

    if ans == @answer
      p "Correct!"
    elsif ans == @answer.lowercase
      p "Correct!"
    else p "Incorrect :("
    end
  end
end

turn = Turn.new("card1")
turn.guess
