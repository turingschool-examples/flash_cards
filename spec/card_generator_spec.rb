'./lib/card_generator'

RSpec.describe CardGenerator do
  it 'exists' do
    card_generator = CardGenerator.new

    expect(card_generator).to be_instance_of(CardGenerator)
  end
end