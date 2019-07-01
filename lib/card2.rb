=begin
class Flashcard

  def initialize (question, answer)
    @question = question
    @answer = answer
  end

def guess(q, a)
  puts "#{@question}"
  user_answer = gets.chomp
  if user_answer == @answer
    puts "correct"
  else
    puts "try again"
end

card1 = Flashcard.new ("how old am I?", 26)

card1.guess
=end

class Card
attr_reader :question, :answer, :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def access_question
  puts  @question
  end
p @question, "asdkljas;ojads"


=begin
  def question
    puts "#{@question}"
  end

  def answer
    puts "#{@answer}"
  end

  def category
    puts "#{@category}"
  end
=end
end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card.access_question
card.answer
card.category
