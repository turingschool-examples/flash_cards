require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    describe 'correct guesses' do
        it 'checks if turn exists' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)
        
            expect(turn).to be_instance_of(Turn)
            expect(turn.card).to eq(card)
            expect(turn.guess). to eq("Juneau")
        end

        it 'checks if card has a correct guess' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.correct?). to eq(true)
        end

        it 'provides feedback for turn guess' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.feedback).to eq("Correct!")
        end
    end

    describe 'incorrect guesses' do
        it 'checks if turn exists' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)
        
            expect(turn).to be_instance_of(Turn)
            expect(turn.card).to eq(card)
            expect(turn.guess). to eq("Saturn")
        end

        it 'checks if card has a correct guess' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)

            expect(turn.correct?). to eq(false)
        end

        it 'provides feedback for turn guess' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)

            expect(turn.feedback).to eq("Incorrect.")
        end
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
