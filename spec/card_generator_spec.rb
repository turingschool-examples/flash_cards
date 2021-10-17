require './lib/card_generator'
filename = "lib/cards.txt"
RSpec.describe CardGenerator do

  describe '#initialize' do
    it 'it exists' do
      filename = "lib/cards.txt"
      cards = CardGenerator.new(filename)
      expect(cards).to be_instance_of(CardGenerator)
    end
  end

  describe '#cards' do
    it 'reads a text file' do
    filename = "lib/cards.txt"
    # cards = CardGenerator.new("lib/cards.txt")
    expect(cards = CardGenerator.new(filename).cards).to eq(cards)
    end

    xit 'generates cards' do
    end
  end
end
#   describe '#cards' do
#     xit '' do
# end
