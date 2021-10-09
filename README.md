##  Flash Cards

Flash cards is a repository that allows the user to play a fun, quiz-like game via the command line. In addition, users may upload their own questions by importing a csv file.

## Setup
Start by cloning down this repo. In the event you wish to use your own questions, import a CSV file with each line including the question, answer, and category. If you wish to use the pre-loaded questions, cd into the lib directory, and run the `flashcard_runner` file. From there you will be prompted questions and must give an answer.

## Gameplay

Questions will be posed in this manner:
<img width="604" alt="Screen Shot 2021-10-09 at 3 04 06 PM" src="https://user-images.githubusercontent.com/78196294/136673765-fd5f099b-b163-4ef1-ba27-f8ca7e95180a.png">

As the game progresses you will recieve real time feedback on your guesses:
<img width="385" alt="Screen Shot 2021-10-09 at 3 04 58 PM" src="https://user-images.githubusercontent.com/78196294/136673780-a52b520a-d857-4a12-be3b-7023f9ca303b.png">

The game will end once no cards remain, and give you a readout of your total score, as well as broken down by category:
<img width="352" alt="Screen Shot 2021-10-09 at 3 06 06 PM" src="https://user-images.githubusercontent.com/78196294/136673801-4660f500-19da-4203-8056-10250ebce29b.png">

## Tech Stack
- Ruby
- Rspec
