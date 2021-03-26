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

  def percent_correct
    percent = (number_correct.to_f / @turns.length.to_f) * 100
    percent.truncate(2)
  end

  def percent_correct_by_category(subject)
    correct = number_correct_by_category(subject)
    total = @turns.select do |turn|
      turn.card.category == subject
    end
    total = total.length
    percent = (correct.to_f / total.to_f) * 100
    percent.truncate(2)
  end

  def start

  end

  def get_guess

  end 



end
