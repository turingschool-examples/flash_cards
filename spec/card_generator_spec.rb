require './lib/card'
require './card_generator'

RSpec.describe CardGenerator do

    filename = "./cards.txt"
    it 'exsits' do
        cardgen = CardGenerator.new(filename)
        expect(cardgen).to be_instance_of(CardGenerator)
    end

end