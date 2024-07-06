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
end
