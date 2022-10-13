
class Round

attr_reader :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @card_index = 0
    @turns = []
    @current_card = @deck.cards[@card_index]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns.push(new_turn)
    if (@card_index < @deck.cards.length)
      @card_index += 1
    end
    @current_card = @deck.cards[@card_index]
    new_turn
  end

  def number_correct()
    correct_count = 0

    @turns.each do |turn|
      if (turn.correct?)
        correct_count += 1
      end
    end

      return correct_count
  end



end
