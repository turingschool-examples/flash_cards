require './lib/interface'

RSpec.describe Interface do
  describe '#initialize' do
    it 'has a card generator' do

      expect(Interface.new().cards).to be_a Array
    end

    it 'has a deck' do
      expect(Interface.new().deck).to be_a Deck
    end

    it 'has a round' do
      expect(Interface.new().round).to be_a Round
    end
  end
end



