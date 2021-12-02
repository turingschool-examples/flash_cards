class Card
  attr_reader :question,
              :answer,
              :category

  def initialize(question, answer, category)
    @question = question
    @answer   = answer
    @category = category
  end

  end


class Turn < Card
def initialize(guess, card)
  @guess  = ()
  @card   = card
end

end
