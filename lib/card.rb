class Card

    attr_reader :question, :answer
    def initialize(question, answer, card_category)
        @question = question
        @answer = answer
        @card_category = []
    end

  def categorize(categorization)
  @card_category << [categorization]
  end

  def category
    print card_category
  end

    def is_a_card
        if card.is_a?(Card) == true
            puts true
        else
            puts false
        end
end
end
