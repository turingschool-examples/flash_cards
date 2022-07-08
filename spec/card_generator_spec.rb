require './lib/card_generator'
filename = "cards.txt"

RSpec.describe CardGenerator do
  it 'exists' do
    card = CardGenerator.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(CardGenerator)
  end

end
