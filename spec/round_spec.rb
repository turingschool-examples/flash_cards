require './lib/round'

RSpec.describe Round do
  it 'exists' do
    round = Round.new()

    expect(round).to be_instance_of(Round)
  end

end