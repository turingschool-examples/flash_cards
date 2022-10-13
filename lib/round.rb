
class Round

attr_reader :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @card_index = 0
    @turns = []
    @current_card = @deck.cards[@card_index]
  end

  def take_turn(guess)
    @turns.push(Turn.new(guess, @current_card))
    @card_index++
    return @turns[@card_index - 1]
  end

  def number_correct()
    correct_count = 0

    @turns.each do |turn|
      if (@turns[turn].correct?)
        correct_count++
      end
    end

      return correct_count
  end
end
