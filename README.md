# Welcome to Flash Cards
An interactive learning game just like you used to make on 3x5 index cards, but better!

### Instructions
- Clone the repo, navigate into the folder and run `ruby flashcard_runner.rb`
- Select whether you want to use the hardcoded questions or load from file
### Custom Cards
- To use your own questions, replace the `cards.txt` file in the root directory
- Each line of `cards.txt` becomes a card
- Use the following syntax for each line: question,answer,category
#### Example
What is the capital of Michigan?,Lansing,Geography
### Notes
- Spaces in category name will automatically be changed to '_'
- Answers are not case sensitive and will match as long as letters are correct
- Enjoy learning!

### Possible Features
- Build in spaced-repetition-learning algorithm to track correct answers and improve learning speed
- Add GUI
- Compiler for capturing large amounts of cards and formatting into csv

This project was built on Turing's [Flash Cards](http://backend.turing.io/module1/projects/flashcards) starter repo.
