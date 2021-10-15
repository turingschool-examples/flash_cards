class Card

  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)

    @question = question
    @answer = answer
    @category  = category

  end



  # def ask_input(answer) # do I need an argument for this method?
  #   answer = gets.chomp # should I use the instance variable when calling answer?
  #     if @answer == answer or @answer.downcase == answer
  #       puts "Correct. The answer is #{@answer}."
  #     else
  #       puts "Incorrect. The answer is #{@answer}."
  #     end
  # end

end


#card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#card.show_question
#card.ask_input("")
