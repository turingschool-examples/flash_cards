class Round
  attr_accessor :deck,
                :turns,
                :current_card_num,
                :current_card,
                :number_correct,
                :correct_answer_hash

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_num = 0
    @current_card = deck.cards[0]
    @number_correct = 0
    @correct_answer_hash = {}
  end

  def take_turn(guess)
    #adds correct answers to correct_answer_hash & total number_correct count
      if guess == @current_card.answer
      @number_correct += 1
    # require "pry"; binding.pry
      if @correct_answer_hash.include? (@current_card.category)
        @correct_answer_hash[@current_card.category] = @correct_answer_hash.value += 1
      else
        @correct_answer_hash[@current_card.category] = 1
      end
    #flips current card to next card
      @current_card_num += 1
      @current_card = deck.cards[@current_card_num]
      #creates a new Turn instance
      new_turn = Turn.new(guess, @current_card)
      require "pry"; binding.pry
      @turns << new_turn
      # return new_turn
    end



  end

  def percent_correct_by_category(category)
    (@number_correct / @turns.count).to_f
  end


end

#  require "pry"; binding.pry
