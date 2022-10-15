require './lib/card_generator'
require 'rspec'

describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      card = CardGenerator.new('stuff')

      expect(card).to be_a CardGenerator
    end

  end

end
