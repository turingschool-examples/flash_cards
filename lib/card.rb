class Card
  attr_reader :question, :answer, :category, :hint

  def initialize(question, answer, category, hint = nil)
    @question = question
    @answer = answer
    @category = category
    @hint = hint
  end
end