require './lib/turn'

class Round
    attr_reader :deck,
                :turns,
                :number_correct

    def initialize(deck)
      @deck = deck
      @turns = []
      @number_correct = 0
      @card_index = 0
      @current_card = @deck.cards[@card_index]
    end

    # def current_card
    #   @deck.cards.shift
    # end

    def take_turn(guess)
      @turn = Turn.new(guess, @current_card)
      @turns << @turn
        if @turn.correct? == true
            @number_correct += 1
        end
        @card_index += 1
        @current_card = @deck.cards[@card_index]
        @turn
      end

    def number_correct_by_category(category)
      @turns.count do |turn|
          turn.card.category == category && turn.correct?
      end
    end

    def percent_correct
      (@number_correct.to_f / @turns.count) * 100
    end

    def percent_correct_by_category(category)
      correct_cat = @turns.count do |turn|
          turn.card.category == category
      end
      (number_correct_by_category(category).to_f / correct_cat) * 100
    end


end