data = read.csv('JEOPARDY.csv') #source https://www.reddit.com/r/datasets/comments/1uyd0t/200000_jeopardy_questions_in_a_json_file/
require(dplyr)
require(stringr)

data %>% select(Category, Question, Answer)  %>% filter(Category %in%
                                                          c('ESTATE QUARTERS', 'WE HELP WITH YOUR COLLEGE APPLICATION', 
                                                                      'FEARnet', 'RUDOLPH', 'THE METRIC SYSTEM')) -> data

data$Category = tolower(data$Category)
data$Answer = tolower(data$Answer)
data$Question = tolower(data$Question)
data1 = data[ ,c(2,3,1)]
data1$Question <- gsub(",", '', data1$Question)
write.table(data1,"more_questions.txt",sep=',', row.names=FALSE, quote = FALSE)
