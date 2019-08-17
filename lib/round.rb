#implements Round class


class Round

     attr_reader    :turns

     def initialize(deck)
       @deck    = deck
       @index   = 0       # @current_card = @deck.cards[0]
       @cards_correct = []
       @turns = []
       @current_turn = nil
     end

     def take_turn(guess)
          @turns << Turn.new(guess, @deck.cards[@index])
          @current_turn = @turns[@index]

          if @current_turn.correct?
               @cards_correct << @deck.cards[@index]
          end

          @index += 1
          @current_turn = @turns[@index-1]
     end

     def number_correct
          @cards_correct.length
     end

     def current_card
           @deck.cards[@index]
     end

     def count
          length
     end

     def last
          @turns[-1] # does not yet manage if called without a last turn available
     end

     # implementation using .each
     # def number_correct_by_category(category)
     #      cards_correct.each {
     #           a << cards_correct.category == category
     #           }
     #      end
     #      a.length
     # end

     def number_correct_by_category(cat)
          num_correct = @cards_correct.find_all do |card_in_correct|
               card_in_correct.category == cat
          end

          num_correct.length
     end

     def percent_correct
          ((number_correct.to_f / @turns.count.to_f) * 100).round(1)
     end

     def percent_correct_by_category(cat)
          ((number_correct_by_category(cat).to_f / @deck.cards_in_category(cat).length.to_f) * 100).round(1)
     end

end
