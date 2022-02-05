# If you use RStudio, you can use the 
# keyboard shortcut Ctrl + Shift + C ( Command + Shift + C on macOS) to comment out a line of text.

# <if ... else statement>
# 
#  if (....) {
#  statement1
#  } else if (....) {
#  statement2
#  } else { <- not mandatory
#  statement3
#  }


x = 0
if (x<0) {
  print('Negative number')
} else if (x>0){
  print('Positive number')
} else
  print('Zero')


# '''
# <Syntax for loop>
# 
# for (val in sequence)
# {
# statement
# }
# 
# '''

x<- c(2,5,3,9,8,11,6)
count <- 0 
for (val in x) {
  if (val %% 2 == 0 ) count = count +1 # double percentage = remainder
}
print(count)

# <While loop>
i <- 1
while (i<6){
  print(i)
  i = i+1
}

# 3.1 Mean and Variance of discrete random variables

# Mean
x <- c(0,1,2,3)
px <- c(0.25,0.25,0.25,0.25)
mu <-sum(x*px)
mu

# or by using for loop

E = 0
for (i in 1:4){
  E = E + x[i]*px[i]
}
print(E)


# Variance = E(X^2) - E(X)^2

var = sum(x^2*px) - mu^2
var


# The Binomial Probability Distribution

# 3.2 Find Probabilities

# Example: A study found 60% of all the voters favor a certain
# candidate. 
# If 20 voters are randomly selected, what is the probability 
# that exactly 11 voters favor the candidate?
# To compute a probability, P(X=11), we may use 
# '''

dbinom(11, size=20, prob=0.6)



# 3.3 Find Cumulative Probabilities

# The random variable X follows a binomial distribution with 
# n=20 and p=0.6

# Q1 : What is the probability that at most 10 voters favor the candidate ?
# To find a cumulative probability, P(X ≤ 10), we use

pbinom(10, size=20, prob=0.6)


# Q2: What is the probability that more than 12 voters favor the candidate?
# To find P(X > 12), note that this equals 1 – P(X ≤ 12), 
# and then find the Cumulative Probability for the input constant ‘12’.
1-pbinom(12, size=20, prob=0.6)


# Q3: What is the probability that the number of voters who 
# favor the candidate is between 8 and 16, inclusive?
# If you need the probability for a range of values like P(8 ≤ X ≤ 16), 
# find the Cumulative Probability for both ‘7’ and ‘16’ and subtract.

pbinom(16, size=20, prob=0.6)-pbinom(7, size=20, prob=0.6)

# P(8 ≤ X ≤ 16) = P(X  ≤ 16) – P(X ≤ 7) = 0.9630099


# 3.4 Draw The Binomial Probability Distribution

# Create a sample of 50 numbers which are incremented by 1.
x <- seq(0,50,by = 1)
#  Create the binomial distribution.
y <- dbinom(x,50,0.5)
#  Give the chart file a name.
png(file = "dbinom.png")
# Plot the graph for this sample.
plot(x,y)


# 3.5 Poisson Distribution

# The Poisson distribution is the probability distribution of 
# independent event occurrences in an interval.
# If there are twelve cars crossing a bridge per minute on 
# average, find the probability of having exactly seventeen 
# cars crossing the bridge in a particular minute.

dpois(17, lambda=12) # P(x = 17) = 0.03832471


# If there are twelve cars crossing a bridge per minute on 
# average, find the probability of having seventeen or more 
# cars crossing the bridge in a particular minute.
1-ppois(16, lambda=12)
# or
ppois(16, lambda=12, lower=FALSE)   # upper tail

# P(x >=17) = 1 – P(x <=16) = 0.101291


# 3.6 Draw The Poisson Probability Distribution

# Create a sample of 50 numbers which are incremented by 1.
x <- seq(0,50,by = 1)
#  Create the binomial distribution.
y <- dpois(x,10)
# Plot the graph for this sample.
plot(x,y)
