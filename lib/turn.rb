class Turn
  attr_reader :card, :question, :answer, :category

def initialize(string, card)
  @string = string
  @card = [question, answer, category]
  @question = "What is the capital of Alaska?"
  @answer = "Juneau"
  @category = :Geography
end

end
