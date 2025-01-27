##### answer lecture 4 
## 1 
student = c(1,2,3,4,5,6,7,8,9,10)
question1 = c(3,3,3,4,3,4,3,4,3,4)
question2 = c(5,2,5,5,2,2,5,5,4,2)
question3 = c(1,3,1,1,1,3,1,1,1,1)
table(student,question1)
tmp=table(student,question1)
table(student,question2)
table(student,question3)

prop.table(tmp,1)
prop.table(tmp,2)
table(student,question2)
tmp=table(student,question2)

prop.table(tmp)
table(student,question3)
tmp=table(student,question3)
prop.table(tmp)

barplot(table(student,question2))
barplot(table(student,question3))


barplot(table(student,question1),table(student,question2),table(student,question3))

barplot(table(question2,question2))
barplot(table(question1,question2,question3))
#### 2 ###
