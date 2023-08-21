class Card
    attr_reader :question,
                :answer,
                :category

  def initialize(question, anser,category)
    @question   = question
    @answer     = answer
    @category   = category
  end

end