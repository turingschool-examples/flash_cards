class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category) # Default values for parameters are null
    @question = question
    @answer = answer
    @category = category.to_sym # Make sure our category variable is a symbol
  end

end
