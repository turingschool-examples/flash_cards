require 'rspec'
require './lib/card_generator'

RSpec.describe CardGenerator do
    it 'exists' do
        cards = CardGenerator.new('cards.txt').cards

        expect(cards).to be_instance_of(CardGenerator)
    end
 
end