require './lib/runner_class.rb'

RSpec.describe FlashCardRunner do
  before(:each) do
    @runner = FlashCardRunner.new
  end

  it 'exists' do
    expect(@runner).to be_instance_of FlashCardRunner
  end
end
