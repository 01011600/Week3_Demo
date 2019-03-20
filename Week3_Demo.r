# Enter data into vectors before constructing
# into the data frame
date_col <- c("2018-15-10", "2018-11-01", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
# 99 is one of the values in the age that need to be addressed
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5,3,3,3,2)
q2_col <- c(4,5,5,3,2)
q3_col <- c(5,2,5,4,1)
# NA inserted in place of missing data
# for the attribute
q4_col <- c(5,5,5,NA,2)
q5_col <- c(5,5,2,NA,1)

column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3","Q4", "Q5")
# construct a data frame for the above vectors
managers <- data.frame(date_col, country_col, gender_col, 
                       age_col, q1_col, q2_col, q3_col,
                       q4_col, q5_col)

managers

# Add column names to data frame using col_names vectors
colnames(managers) <- column_names
str(managers)
head(managers, 20)

# Recode the incorrect age of 99 to NA
managers$Age[managers$Age == 99] <- NA
managers

#create a new attribute called age_cat and set values
# in age_cat to the folllowing if true
# <=25 =young
# <>=26 & <=44 = middle aged
# >=45 = Eldery
# We will also recode ago NA to Eldery

managers$age_cat[managers$Age >=45] <- "Eldery"
managers$age_cat[managers$Age <=25] <- "Young"
managers$age_cat[managers$Age >=26 & managers$Age <=44] <- "Middle Aged"
managers

#recode NA in age field to "Eldery"
managers$age_cat[is.na(managers$Age)] <- "Eldery"
str(managers)
#add summary column to the data frame
summary_col <- managers$Q1 +managers$Q2 + managers$Q3 + managers$Q4 + managers$Q5

managers <- data.frame(managers, summary_col)
#calcutlate the mean value for each row
mean_value <- rowMeans(managers[5:9])
managers <- data.frame(managers, mean_value)
managers
# Change name of this column to "Mean value"
names(managers)[12] <- "Mean value"

#change name of summary col to "answer total"
names(managers)[11] <- "Answer total"

#Change name of age_cat to "Age category"
names(managers)[10] <- "Age Category"
managers