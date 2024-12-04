# turn_spec.rb - run RSpec based tests on Turn class
# Yes I know these are almost redundant, just starting with being thorough

require './lib/turn'
require 'rspec'         #It seems starting with 'RSpec.describe' also takes care of this dependency
#NOTE: it appears rspec is actually not required above (I commented it out and the file still executed)

describe Turn do
    #Another option: group the following few tests into an '#initialize' description
    describe 'exists' do
        #Tests here
    end
end
