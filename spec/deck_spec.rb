require './lib/card'
require './lib/deck'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Deck do
  it 'exists' do
  deck = Deck.new[]
    deck = Deck.new[:Geography, ]
    expect(deck).to be_instance_of(Deck)
end

end