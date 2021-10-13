class Card

  attr_reader :Geography

  def initialize(question, answer)

    @question = question
    @answer = answer


  end

  def show_question
    puts @question
  end

  def ask_for_answer(user_input)
    gets user_input
      if user_input == @answer || user_input == answer.downcase
        puts "Correct. The answer is Juneau."
      else
        puts "Incorrect. The answer is Juneau."
      end
  end

end

card = Card.new("What is the capital of Alaska?", "Juneau")
card.show_question
card.ask_for_answer
