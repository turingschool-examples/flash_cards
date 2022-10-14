class Card

  attr_reader :answer, :category, :question

  #initialize with :question :answer and :category
  def initialize(card_array)

  # def initialize(question, answer, category)
    @question = card_array[0]
    @answer = card_array[1]
    @category = card_array[2]
  end

end
