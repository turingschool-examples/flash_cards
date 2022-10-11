class Card

  attr_reader :question, :answer, :category


  def initialize(_question, _answer, _category)
    @question = _question
    @answer = _answer
    @category = _category
  end


end
