#testing github

class Card

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def get_question
    @question
  end

  def get_answer
    @answer
  end

  def get_category
    @category
  end

end

card = Card.new("This is a question?", "Yes", :test)

puts card.get_question
