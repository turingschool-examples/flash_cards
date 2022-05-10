require './lib/card'
require './lib/turns'

RSpec.describe Turns do
  ##Do I need this line 10??
  it 'exists' do
    turns = Turns.new("Juneau", card)

    expect(turns).to be_instance_of(Turns)
  end
end
