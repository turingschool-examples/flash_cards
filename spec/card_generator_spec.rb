require './lib/card_generator'
filename = "cards.txt"

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe CardGenerator do
    before (:all) do
        cards = CardGenerator.new(filename).cards
    end

    it 'exists' do
        expect(cards).to be_instance_of CardGenerator
    end
end
