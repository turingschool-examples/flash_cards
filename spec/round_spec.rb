require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
    it 'uses a deck of cards' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_instance_of Round
        expect(round.deck).to eq deck
    end

    it 'has turns and can record them' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.turns).to eq []
    end

    it 'can return the current card' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end
        
    it 'has a method that creates a new turn' do

        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        round = Round.new(deck)

        new_turn = round.take_turn("Bamboo")

        expect(new_turn).to be_instance_of(Turn)
        expect(new_turn.card).to eq(card_1)
        expect(new_turn.guess).to eq("Bamboo")
    end 

    it 'can determine a correct or incorrect answer' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        round = Round.new(deck)

        new_turn = round.take_turn("Bamboo")

        expect(new_turn.correct?).to eq(true)
    end

    it 'can record turns' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        round = Round.new(deck)

        new_turn = round.take_turn("Bamboo")


        expect(round.turns).to eq [@turns] 
        expect(round.number_correct).to eq 1
        expect(round.current_card).to eq card_2

     end

    it 'handles incorrect answers' do

        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
            
        deck = Deck.new([card_1, card_2, card_3])
            
        round = Round.new(deck)

        new_turn = round.take_turn("Venus")
        
        expect(new_turn.guess).to eq "Venus"
        expect(new_turn.correct?).to eq(false)
        expect(round.turns.last.feedback).to eq("Wrong!")
    end

    it 'records statistics on answers' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
            
        deck = Deck.new([card_1, card_2, card_3])
            
        round = Round.new(deck)

        expect(round.number_correct).to eq 1
        expect(round.number_correct_by_category(:Animals)).to eq(1)
        expect(round.number_correct_by_category(:STEM)).to eq(0)
        expect(round.percent_correct).to eq(50.0)
        expect(round.percent_correct_by_category(:Animals)).to eq(100.0)
        expect(round.current_card).to eq card_3
    end
end