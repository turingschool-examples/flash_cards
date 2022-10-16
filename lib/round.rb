class Round
  attr_reader :deck, :turns, :number_correct, :current_card, :percent_correct

  def initialize (deck)

    @deck = deck
    @turns = []
    @number_correct = 0
    @current_card = deck.card.first
    @percent_correct = 0
  end

  def take_turn (guess)
    if guess == @current_card.answer
      @number_correct += 1
    end
    @turns << Turn.new(guess, @current_card)
    @current_card = @deck.card[@turns.length]
    return @turns[-1]

  end





  def number_correct_by_category (category)
    counter = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        counter += 1
      end


    end
    return counter









  end



  def percent_correct
    ((@number_correct.to_f / @turns.length)* 100).round

  end



  def percent_correct_by_category (category)
    ((self.number_correct_by_category(category).to_f / @turns.length)* 100).round





  end




















end
