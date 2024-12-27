require './lib/card' #links the card.rb file to the card_spec.rb file
require 'rspec' #links the rspec gem to the card_spec.rb file
require 'pry' # This is required to use Pry

#rspec spec/card_spec.rb is the command to run the test

# to run test in terminal type rspec spec/card_spec.rb

RSpec.describe Card do #rspec syntax to describe the Card class
  before(:each) do #before each test, do the following
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end
#creates a new instance of the Card class with the following parameters
#passes arguments to the Card class to create a new instance of the Card class
  it 'exists' do #set up
    expect(@card).to be_instance_of(Card) #execute
  end
#test named 'exists' that checks if the card instance is an instance of the Card class
  it 'has a question' do #set up
    expect(@card.question).to eq("What is the capital of Alaska?") #execute
  end
#test named 'has a question' that checks if the question is equal to the string "What is the capital of Alaska?"
  it 'has an answer' do #set up
    expect(@card.answer).to eq("Juneau") #execute
  end
#test named 'has an answer' that checks if the answer is equal to the string "Juneau"
  it 'has a category' do #set up
    expect(@card.category).to eq(:Geography)  #execute
  end
end
#test named 'has a category' that checks if the category is equal to the symbol :Geography
# binding.pry # This will open a Pry session after the test execution

#SEAT 

#set up example: has to have a thing to test as in .new
#execute example: [expect(@card.answer)] the method actually calling the instance (verbing a noun) 
#assert example: expect(Card.new("What is the capital of Alaska?", "Juneau", :Geography)).to be_instance_of(Card) "output"
#teardown example:  done by RSpec

#common git commands are:
#git add . - adds all files to the staging area
#git commit -m "message" - commits the files to the repository
#git push - pushes the files to the remote repository
#git pull - pulls the files from the remote repository
#git status - checks the status of the files in the repository
#git log - shows the commit history of the repository
#git branch - shows the branches in the repository
#git checkout -b branch_name - creates a new branch
#git checkout branch_name - switches to the specified branch
#git merge branch_name - merges the specified branch into the current branch
#git clone repository_url - clones a repository from the specified URL
#git remote -v - shows the remote repositories associated with the local repository
#git remote add origin repository_url - adds a remote repository to the local repository
#git remote remove origin - removes the remote repository from the local repository
#git reset --hard HEAD - resets the changes in the working directory to the last commit
#git stash - temporarily stores changes in the working directory