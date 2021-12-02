require './lib/card_generator'

RSpec.describe CardGenerator do
  it 'exists' do
    generator = CardGenerator.new

    expect(generator).to be_an_instance_of(CardGenerator)
  end
end
