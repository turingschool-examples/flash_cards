class Round

  attr_reader :deck, :turns
  attr_accessor :number_correct, :count, :total_cards, :cats

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @count = 1
    @total_cards = 0
    @cats = [] # need for puts statement in runner file
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(turn_guess, card = @deck.cards[0])
    @deck.cards.shift
    @count += 1
    next_turn = Turn.new(turn_guess, card)
    @turns << next_turn
    if @turns.last.correct?
      @number_correct += 1
    end
    next_turn
  end

  def number_correct
    @number_correct
  end

  def percent_correct
    (number_correct.to_f / turns.size.to_f) * 100
  end

  def number_correct_by_category(cat)
    counter = 0
    @turns.each do |turn|
      if (turn.correct?) && (turn.card.category == cat)
        counter += 1
      end
    end
    counter
  end

  def percent_correct_by_category(cat)
    counter = 0
    @turns.each do |turn|
      if turn.card.category == cat
        counter += 1
      end
    end
    (number_correct_by_category(cat).to_f / counter.to_f) * 100
  end

  def categories_used
    deck.cards.each do |card|
      if !(@cats.include?(card.category))
        @cats << card.category
      end
    end
  end

  
end