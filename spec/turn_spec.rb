require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.configure do |config|
    config.formatter = :documentation 
    end

RSpec.describe Turn do
    before(:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn1 = Turn.new("Juneau", @card)
        @turn2 = Turn.new("Saturn", @card)
    end

    it 'exists and has attributes' do
        expect(@turn1).to be_instance_of(Turn)
        expect(@turn1.guess).to eq("Juneau")
        expect(@turn1.card).to eq(@card)
    end
 
    it 'can check if a guess is true' do
        expect(@turn1.correct?).to eq(true)
    end   

    it 'can check if a guess if false' do
        expect(@turn2.correct?).to eq(false)
    end
    
    it 'can return feedback of correct or incorrect' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     
        new_turn1 = Turn.new("Juneau", card_1)
        new_turn2 = Turn.new("Juneau", card_2)
        expect(new_turn1.feedback).to eq("Your answer is correct!")
       
        expect(new_turn2.feedback).to eq("I'm sorry your answer is incorrect.")
    end

#    xit 'can be a new turn' do
#         card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#         new_turn = Turn.new("Juneau", card)
#         expect(new_turn).to be_instance_of(Turn)
#         expect(new_turn.class).to eq(Turn)
#         expect(new_turn.correct?).to eq(true)
#     end
  
end