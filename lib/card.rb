class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def says_question
    puts "#{question}"
  end

  def says_answer
    puts "#{answer}"
  end

  def says_category
    puts "#{category}"
  end

end
