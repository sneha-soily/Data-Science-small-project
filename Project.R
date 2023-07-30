State<-c("Alabama", "Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","lowa","kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New_Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsim","Wyoming")
Murder<-c(13.2,10,8.1,8.8,9,7.9,3.3,5.9,15.4,17.4,5.3,2.6,10.4,7.2,2.2,6,9.7,15.4,2.1,11.3,4.4,12.1,2.7,16.1,9,6,4.3,12.2,2.1,7.4,11.4,11.1,13,0.8,7.3,6.6,4.9,6.3,3.4,14.4,3.8,13.2,12.7,3.2,2.2,8.5,4,5.7,2.6,6.8)
Assault<-c(236,263,294,190,276,204,110,238,335,0,46,120,249,11,56,115,109,249,83,300,149,255,72,259,178,109,102,252,57,159,285,254,337,45,120,151,159,106,174,879,86,188,201,120,48,156,145,81,53,161)
Urban_population<-c(58,48,80,50,91,78,77,72,80,60,83,54,83,65,570,66,52,66,51,67,85,74,66,44,70,53,62,81,56,89,70,6,45,44,75,68,67,72,87,48,45,59,80,80,32,63,73,39,66,60)
dataset<-data.frame(State,Murder,Assault,Urban_population,Population_level)
dataset
is.na(dataset$Urban_population) <- dataset$Urban_population == 6
is.na(dataset$Urban_population) <- dataset$Urban_population == 570
dataset$Urban_population = ifelse(is.na(dataset$Urban_population),ave(dataset$Urban_population,
FUN = function(x) mean(x, na.rm = TRUE)),dataset$Urban_population) 
#replacing 0 with na
is.na(dataset$Assault) <- dataset$Assault == 0 
#replacing na with mean value
dataset$Assault = ifelse(is.na(dataset$Assault),ave(dataset$Assault,
FUN = function(x) mean(x, na.rm = TRUE)),dataset$Assault)
dataset$Assault[40]<-(dataset$Assault[40])/10

Code
#population level
Population_level<-c(2,1,4,2,4,4,4,4,4,3,4,2,4,3,4,3,2,3,2,3,4,4,3,1,4,2,3,4,1,4,4,1,1,1,4,3,3,4,4,1,1,1,4,4,1,3,4,1,3,3)


#Rounding all the data attributes, the 0 in the round function indicates #that the output will be intergal
dataset$Murder<-as.numeric(format(round(dataset$Murder, 0)))

dataset$Assault<-as.numeric(format(round(dataset$Assault, 0)))

dataset$Urban_population<-as.numeric(format(round(dataset$Urban_population, 0)))

Code:
  
  
#factor
Ranking <- factor(Population_level, order= TRUE, levels = c(1,2,3,4), labels=c("small", "medium", "large", "extra-large"))

Ordered_factor_population = Ranking
dataset<- data.frame(State, Murder, Assault, Urban_population, Ordered_factor_population,Population_level)

  

