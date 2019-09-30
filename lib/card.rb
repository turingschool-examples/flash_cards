class Card
  attr_accessor :question, :answer, :geography, :people, :places, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @geography = category
    @people = category
    @places = category
    @category = category   
  end
end
