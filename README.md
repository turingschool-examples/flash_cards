##  Flash Cards

This is the starter repository for the [Flash Cards](http://backend.turing.io/module1/projects/flashcards) project.


## Notes For Project
- Outline for starting work
    - Start with creating all files needed in lib directory and spec directory
        - Commit and push each file when created
    - Once files are made, start with writing first psuedo-code and then tests for 'smallest' class (probably the card class)
    - After each individual test within the test file is written, commit
        - Then write the pseudo-code and code part of the class that that test will be testing, commit
    - Once all tests are written and all methods are written within the class (and the tests are all passing),
      move on to next class and follow the same steps

- Classes needed for iteration 1 + 2
    - Card class
        - Methods/Attributes needed: question, answer, category
    - Turn class
        - Methods/Attributes needed: card, guess, correct?, feedback
    - Deck class
        - Methods/Attributes needed: cards, count, cards_in_category, last(?)
    - Round class
        - Methods/Attributes needed: deck, turns, current_card, take_turn, class, correct?, number_correct,
          last(?), number_correct_by_category, percent_correct, percent_correct_by_category
