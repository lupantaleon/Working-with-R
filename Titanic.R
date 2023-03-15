install.packages("titanic")
library(tidyverse)
data("titanic_train",package="titanic")
head(titanic_train)
install.packages("rpart")
library(rpart) #hace los calculos
install.packages("rattle")
library(rattle) #para darle forma a la grafica
install.packages("rpart.plot")
library(rpart.plot) #para darle forma a la grafica 

# Hago una funcion para este tipo de modelo llamada Rpart.
#con rpart necesito tener tres partes
# La formula q queremos entrenar 
# Luego ponemos lo que queremos predecir, en este caso survived 
# Agregamos las variables que nos interesan para predecir (Sex and Age)
# despues a la funcion tenemos que pasarle los datos de donde va a uscar la info
# method = class para que prediga sobre la clase 

arbol <- rpart(
  formula = Survived ~ Sex + Age, 
  data = titanic_train,
  method = "class"
)

#graficar el arbol 

install.packages ("rpart.plot").
fancyRpartPlot(arbol)

# prediciendo el arbol 
pred_arbol <- predict (arbol, type= "class")
titanic_pred <- cbind(titanic_train, pred_arbol)

# Pasajero masculino de 4 años de edad
predict (object =arbol,
         newdata =data.frame (Age = 4, Sex= "Male"),
         type = "class")
        


