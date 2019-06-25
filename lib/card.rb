class Card1(question, answer, category)
  attr_reader :question, :answer, :category

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

Card1.new("What is the capital of Alaska?", "Juneau", :Geography)
