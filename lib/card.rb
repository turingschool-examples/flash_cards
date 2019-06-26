
class Card

attr_reader :question,
            :answer,
            :category

def initialize(question, answer, category) #init variables for card class
  @question = question #assigning inits
  @answer = answer
  @category = category
end #end init method


  def question
    puts "#{@question}"
  end #end method

  def answer
    puts "#{@answer}"
  end

  def category
    puts "#{@category}"
  end
end
card1 = Card.new("what is the element W?", "Tungsten", :science ) #creates new card

#begin calling methods
card1.question
card1.answer
card1.category
