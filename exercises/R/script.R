# 1. Set working directory ====
getwd()

# 2. Load data ====
df<-read.csv( "exercises/data/Flight Subset 2013.csv")

# 3. Variable changes ====
df$month_name = month.name[df$month]
df$carrier <- as.factor(df$carrier)
df$tailnum <- as.factor(df$tailnum)
df$origin <- as.factor(df$origin)

for(i in 1:length(df$dep_delay)){
if(is.na(df$dep_delay[[i]])== T){
df[i, "dep_delay_cat"] <- NA
}else if(df$dep_delay[[i]] < -30){
    df[i, "dep_delay_cat"] <- delay_categories[[1]]
       }else if(df$dep_delay[[i]] < 30){
    df[i, "dep_delay_cat"] <- delay_categories[[2]]
  } else {
    df[i, "dep_delay_cat"] <- delay_categories[[3]]
  }
}

df$dep_delay_cat <- as.factor(df$dep_delay_cat)
delay_categories <- c("Early", "Kind of on time", "Late")
