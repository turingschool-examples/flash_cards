class Card
  #combines attr_reader and attr_writer
  attr_accessor :question, :answer, :category

  #this allows the following variables to be used over and over in instances
  def initialize(question, answer, category)
    @question = question
    @answer   = answer
    @category = category
  end
end
