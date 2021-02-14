getwd()
setwd("~/RProjects/data-science-social-scientists/Module 1")

# Question 12
print("Hello world!")

# Question 13
z <- c(pi, 205, 149, -2)
y <- c(z, 555, z)
y <- 2 * y + 760
my_sqrt <- sqrt(y - 1)
# The first line of the code assigns a vector of four numbers to the object z. In the second line we create the vector y that has a size of 9; it is composed by the four elements of z, 555, followed again by the four elements of z. In lines 3 and 4, we perform some additional operations. It is important to remember that when other operands are of size 1, R 'recycles' the shorter vector until it is the same length as the longer vector. Thus, my_sqrt has also a length of 9.

# Question 14
0 / 0
# Using the documentation we have provided you with, take a look at the special values in R. In general, NA corresponds to a missing value, and NaN to “not a number. If we try to divide zero by zero, we know that the answer is indeterminate (Google what is Siri’s response when he/ she is asked this question). In R language, the result is treated as “not a number”. This is different from a missing value that corresponds to NA where we simply don’t have the information.

# Question 15
NA + 5
# In R every time you perform an operation with a missing value, you’ll get as a result a missing value as well.

# Question 16
age <- c(12, 28, 35, 27, NA, 25, 32, 45, 31, 23, NA, 34)

age[c(-5, -11)]
age[-c(5, 11)]
age[c(1, 2, 3, 4, 6, 7, 8, 9, 10, 12)]
age[!is.na(age)]
# In order to get the vector without those missing values, we can identify the position in which they are located. We can choose then the ones without those missing values by using the code age[c(1, 2, 3, 4, 6, 7, 8, 9, 10, 12)]. We can try to simplify this, by just telling R to omit those positions where they are located, and this is possible using two different ways: age[-c(5, 11)], and age[c(-5, -11)]. We can even simplify this more, and use the is.na function, asking first where are the missing values and then using the negation symbol !. Then, we can do this by age[!is.na(age)].

# Question 17
install.packages("tidyverse")
library(tidyverse)
papers <- as_tibble(read.csv("CitesforSara.csv"))
papers_select <- select(papers, "journal", "year", "cites", "title", "au1")

# Question 18
summary(filter(papers_select, cites >= 100))
# The following line of code can be used to figure out the the number of records which have >= 100 citations. The number of records is akin to the number of rows in a filtered dataset:
# summary(filter(papers, cites >= 100)
# The output from this command tells us that the variable journal has a length of 205, which is the correct answer.

# Question 19
summarize(group_by(papers_select, journal), nb_cites = sum(cites))
# The following line of code can be used to figure out the sum of citations by journal. The first part of the summarize() function is the group_by() function, which takes in an argument papers (the dataset) and groups by journal. The second argument in the summarize() function creates a new variable (sum_ci) which generates a total number of citations per journal group. The resulting output shows us that 75789 is the correct answer:
# summarize(group_by(papers, journal), sum_ci = sum(cites))

# Question 20
summarize(papers, count = n_distinct(au1))
summarize(group_by(papers, au1), count = n())
# The following line of code can be used to count the number of distinct a1 observations in papers. The only argument used in this call to n_distinct() specifies what variable we are counting over, which is represented by papers$au1:
# n_distinct(papers$au1)

# Question 21
papers_female <- select(papers, contains("female"))
