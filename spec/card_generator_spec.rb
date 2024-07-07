require './lib/card_generator'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe CardGenerator do
    before (:all) do
        @filename = "cards.txt"
        @cards = CardGenerator.new(@filename)
    end

    it 'exists' do
        expect(@cards).to be_instance_of CardGenerator
    end

    it 'has existing .txt file' do
        expect(@cards.filename).to eq @filename
    end

    it 'opens the file' do
        expect(@cards.file).to be_instance_of File
    end

    it 'reads the data on the file' do
        expect(@cards.data). to be_instance_of Array
    end

    it 'splits first string into three string' do
        expect(@cards.card_data[0]). to eq ["What is the capital of Alaska?","Juneau","Geography"]
    end

    it 'splits last string into three strings' do
        expect(@cards.card_data[6]). to eq ["What cardboard cutout lives at Turing?","Justin bieber","PopCulture"]
    end

    xit 'create a card using each new string for each attribute' do
    
    end
    
    xit 'adds new Card into cards array' do

    end
    xit 'creates a card for each line in the file' do
        expect(@cards.cards.count). to eq @cards.data.count 
    end
end
