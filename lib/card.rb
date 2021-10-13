class Card

  attr_accessor :Geography

  def initialize(question, answer)

    @question = question
    @answer = answer

  end

  def show_question
    puts @question
  end

  def ask_for_answer
    gets @answer
      if @answer == answer || @answer == answer.downcase
        puts "Correct. The answer is Juneau."
      else
        puts "Incorrect. The answer is Juneau."
      end
  end

end

card = Card.new("What is the capital of Alaska?", "Juneau")
