#implements Round class

class Round

     def initialize(deck)
       @deck    = deck
       @index   = 0
       @cards_correct = []
     end

     def take_turn(guess)
          turn = Turn.new(guess, @deck.cards[@index])
          @index = @index + 1
          if turn.correct?
               cards_correct << @deck.cards[@index]
          end

          turn
     end

     def turns()
          @deck[0..(@index-1)]
     end

     def current_card()
          @deck[@index]
     end

     def number_correct()
          @cards_correct.length
     end

     def current_card()
          @deck.cards[@index]
     end

     def count()
          length
     end

     def last()
          @deck[@index-1]
     end

     # def number_correct_by_category(category)
     #      cards_correct.each {
     #           a << cards_correct.category == category
     #           }
     #      end
     #      a.length
     # end

     def number_correct_by_category(cat)
          @cards_correct.find_all { |x| x.category == cat}
     end

     def percent_correct()
          ((number_correct() / @deck.length) * 100).round(1)
     end

     def percent_correct_by_category(cat)
          ((number_correct_by_category() / @deck.cards_in_category(cat).length) * 100).round(1)
     end

end

#temp testing scripts

require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3])

round = Round.new(deck)
round.deck
round.turns
round.current_card
new_turn = round.take_turn("Juneau")
new_turn.class
new_turn.correct?
round.turns
round.number_correct
round.current_card
round.take_turn("Venus")
round.turns.count
round.turns.last.feedback
round.number_correct
round.number_correct_by_category(:Geography)
round.number_correct_by_category(:STEM)
round.percent_correct
round.percent_correct_by_category(:Geography)
round.current_card
