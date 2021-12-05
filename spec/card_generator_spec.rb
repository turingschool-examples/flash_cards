require './lib/card_generator'

RSpec.describe CardGenerator do
    before(:each) do
      @card_maker = CardGenerator.new('./cards.txt')
    end

    it 'is initialized with a string pointing to a text file' do
      expect(@card_maker).to be_instance_of CardGenerator
  end

  it 'contains an array of Card objets' do
    expect(@card_maker.cards).to be_instance_of Array
    @card_maker.cards.each { |card| expect(card).to be_instance_of Card }
  end
end
