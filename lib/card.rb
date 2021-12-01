
class Card
  attr_reader :question, :answer, :category
  def initialize(question, answer, category)
    @question = question
    @answer   = answer
    @category = category
  end

end

#class Turn
#  def initialize(string, card)
#    @string = string
#    @card   = card
#  end

#  def guess()
#    guess =
# end
