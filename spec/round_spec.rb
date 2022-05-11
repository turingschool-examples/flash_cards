require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'


RSpec.describe Deck do

  it 'exists' do

    round = Round.new()

    expect(round).to be_instance_of(Round)

  end

end
