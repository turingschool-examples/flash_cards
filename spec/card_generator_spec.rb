require './lib/card_generator'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    expect(card_generator).to be_a(CardGenerator)
  end

end
