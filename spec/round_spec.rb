require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")
card2 = Card.new("What does Dr. Reeve love?", "Poms", "Personal")
card3 = Card.new("What vein is best to place and IV catheter?", "Cephalic", "Medical")
card4 = Card.new("What species is Solensia for?", "Felines", "Medical")
card5 = Card.new("How is Leptospirosis most commonly transmitted?", "Urine", "Medical")
card6 Card.new("What is a common anti-inflammatory for cats?", "Onsior", "Medical")
card7 Card.new("What behavior do Natasha's favorite appointments have?", "Aggressive", "Personal")

cards = [card1, card2, card3, card4, card5, card6, card7]

turn1 = Turn.new(card1, "Chemo")
turn2 = Turn.new(card2, "Poms")
turn3 = Turn.new(card3, "Saphenous")
turn4 = Turn.new(card4, "Felines")
turn5 = Turn.new(card5, "Blood")
turn6 = Turn.new(card6, "Onsior")
turn7 = Turn.new(card7, "Friendly")

turns = [turn1, turn2, turn3, turn4, turn5, turn6, turn7]

deck = Deck.new(cards)

round = Round.new(deck)


#require 'pry'; binding.pry


RSpec.describe Round do


    it 'can give the current card' do
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)
    
        expect(round.current_card).to eq(card1)
    end

    it 'starts with an empty array of turns' do

        expect(round.turns).to eq([])
      end

      it 'can update the current card to the next card in the deck' do
        round.take_turn("chemo")

        expect(round.current_card).to eq(card2)
      end

      it 'can provide feedback' do
        new_turn = round.take_turn("chemo")
        
        expect(new_turn.correct?).to be false
        expect(new_turn.feedback).to eq("incorrect.")
      end
end