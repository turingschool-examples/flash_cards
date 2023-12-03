require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    it 'checks if turn1 exists' do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)
       
        expect(turn1).to be_instance_of(Turn)
    end

    it 'checks if turn2 exists' do
        card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn2 = Turn.new("Mercury", card2)
       
        expect(turn2).to be_instance_of(Turn)
    end

    it 'checks if turn1 has a card' do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)

        expect(turn1.card).to eq(card1)
    end

    it 'checks if turn2 also has a card' do
        card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn2 = Turn.new("Mercury", card2)

        expect(turn2.card).to eq(card2)
    end

    it 'checks if card1 has an answer' do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)

        expect(turn1.guess). to eq("Juneau")
    end

    it 'checks if card2 also has an answer' do
        card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn2 = Turn.new("Mercury", card2)

        expect(turn2.guess). to eq("Mercury")
    end

    it 'checks if card1 has a correct guess' do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)

        expect(turn1.correct?). to eq(true)
    end

        it 'checks if card2 has a correct guess' do
        card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn2 = Turn.new("Mercury", card2)

        expect(turn2.correct?). to eq(true)
    end

    it 'provides feedback for turn1 guess' do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)

        expect(turn1.feedback).to eq("Correct!")
    end

        it 'provides feedback for turn2 guess' do
        card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn2 = Turn.new("Mercury", card2)

        expect(turn2.feedback).to eq("Correct!")
    end
end


# pry(main)> require './lib/turn'
# #=> true

# pry(main)> require './lib/card'
# #=> true

# pry(main)> card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

# pry(main)> turn = Turn.new("Juneau", card)
# #=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:geography>, @guess="Juneau">

# pry(main)> turn.card
# #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

# pry(main)> turn.guess
# => "Juneau"

# pry(main)> turn.correct?
# #=> true

# pry(main)> turn.feedback
# #=> "Correct!"
