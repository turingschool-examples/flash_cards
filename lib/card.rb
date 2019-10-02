class Card
  attr_reader :question, :category
  attr_accessor :answer

def introduction
  p "Welcome to the game!"
end

def initialize(question, answer, category)
  @question = question
  @answer = answer
  @category = category
  end

end

p 
