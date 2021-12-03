class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_category = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
      new_turn = Turn.new(guess,current_card)
      @turns << new_turn

      if new_turn.correct?
        @correct_category << @deck.cards[0].category
        @number_correct +=1
      end

      @deck.cards.shift
      new_turn
  end

  def number_correct_by_category(category)
    if @correct_category.include?(category)
      return @correct_category.count(category)
    else
      0
    end
  end

  def percent_correct
    @number_correct.to_f / @turns.size * 100
  end

  def percent_correct_by_category(category)
    if @correct_category.include?(category)
      100 #Add stuff to include   number of correct category / how many of certain category appeared * 100 for percentage 
    else
      0
    end

  end
end
