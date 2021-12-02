require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  it 'exists' do
    round = Round.new()
    expect(round).to be_instance_of(Round)
  end
end
