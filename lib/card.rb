# Richard Tillies
# October 12, 2021
# Card class
# ~/turing/1module/projects/flash_cards/lib/card.rb

class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

# Individual methods not needed due to attr_reader
  # def question
  #   @question
  # end
  #
  # def answer
  #   @answer
  # end
  #
  # def category
  #   @category
  # end
end
