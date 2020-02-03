class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_answer = 0
    @category_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
    # @deck.cards.map do |card|
    #   if turn.guess == card.answer
    #     @correct_answer += 1
    #   end
    # end
    # turn 
    # @correct_answer
  end


  def number_correct

    # require "pry"; binding.pry
    @turns.map do |turn|
      if turn.guess == @deck.cards.each do |card|
                          card.answer
                        end
        @correct_answer += 1
      end
    end
    @correct_answer
  end

  def number_correct_by_category(category)

    @turns.map do |turn|
      if turn.guess || turn.card.category == @deck.cards.each do |card|
                          card.answer || card.category
                        end
        @category_correct += 1
      end
    end 
      @category_correct
  end
end
