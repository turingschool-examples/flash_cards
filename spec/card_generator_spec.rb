require './lib/card'

RSpec.describe CardGenerator do 

  before :each do 
    @card_1 = CardGenerator.new("What is 5 + 5?", "10", "STEM")
    @card_2 = CardGenerator.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
    @card_3 = CardGenerator.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    @card_4 = CardGenerator.new("What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture")
  end 
  it "exists" do 
    
  end 
end 