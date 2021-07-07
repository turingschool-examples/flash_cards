class Card

  attr_reader :quest, :answer, :category

  def initialize(quest, answer, category)
    @quest    = quest
    @answer   = answer
    @category = category
  end

  def question
    @quest
  end

  def answer
    @answer
  end

  def category
    @category
  end
end
