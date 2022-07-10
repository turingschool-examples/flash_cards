require './lib/card_generator'

RSpec.describe CardGenerator do 

    before :each do 
        @filename = "cards.txt" 
        @card_generator = CardGenerator.new(@filename)
        @cards = @card_generator.cards
    end 

    it 'exists' do             
        expect(@card_generator).to be_instance_of(CardGenerator)
    end 
    
    it 'reads file' do
        expect(@card_generator.cards).to eq(@cards)
    end 

end  
