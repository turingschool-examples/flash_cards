require './lib/card_generator.rb'
require 'pry'

RSpec.describe CardGenerator do
    it 'exists' do
        filename = "cards.txt"
        cg = CardGenerator.new(filename)

        expect(cg).to be_a(CardGenerator)
    end
end