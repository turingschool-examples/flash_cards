class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
  card = current_card
  turn = Turn.new(guess, card)
  end

  def store_turn(turn)
    @turns << turn
    deck.cards.shift
  end

  def number_correct
    correct = @turns.select do |turn|
      turn.correct? == true
    end
    return correct.length
  end

  def number_correct_by_category(subject)
    group = @turns.select do |turn|
      turn.card.category == subject
    end

    correct = group.select do |turn|
      turn.correct? == true
    end

    correct.length

  end



end
