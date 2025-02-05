require 'rspec'
require './lib/hint'


# I really didn't want to do it but I know how important it is to test everything so I made this hint test file

describe Hint do
  before(:each) do
    @hint = Hint.new("This is a hint")
  end

  it 'initialize' do
    expect(@hint).to be_instance_of(Hint)
  end

  it 'the hint string' do
    expect(@hint.hint_text).to eq("This is a hint")
  end
end