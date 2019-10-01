require './lib/card'

class Turn < Card
  attr_accessor :answer, :card, :correct

  def initialize(answer, card)
    @answer = answer
    @card = card
    @correct = false
  end

  def guess
    #puts "Answer: #{@answer}"
    guess = @answer #gets.chomp
  end

  def card
    @card.question
  end

  def correct?
    @correct = guess == @card.answer
  end

  def feedback
    if @correct == true
      "Correct!"
    else
      "Incorrect. Try Again."
    end
  end

end

card_1 = Card.new("What is the sum of 5 + 5?", 10, :Math)
turn_1 =  Turn.new(11, card_1)

puts turn_1.card
puts turn_1.guess
puts turn_1.correct?
puts turn_1.feedback
