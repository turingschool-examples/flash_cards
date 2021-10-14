class Card
  attr_reader :question, :answer, :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

# class Turn
#    attr_reader :card, :guess
#   def initialize(string, card)
#     @guess = string
#     @card = turn
#   end
# end
