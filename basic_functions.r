random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] = rand.impute(dataframe[,col])
  }
  dataframe
}


rand.impute <- function(x) {
  # missing contiene un vector de valores T/F dependiendo del NA de x
  missing <- is.na(x)
  #n.missing contiene cuantos valores son NA dentro de x
  n.missing <- sum(missing)
  #x.obs son los valores conocidos que tienen dato diferente de NA en x
  x.obs <- x[!missing]
  #por defecto, devolverÃ© lo mismo que habÃ­a entrado por parÃ¡metro
  imputed <- x
  #en los valores que faltaban, los reemplazamos por una muestra
  #de los que si conocemos (MAS)
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE)
  return (imputed)
}


random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] = rand.impute(dataframe[,col])
  }
  dataframe
}



### call the function
new_df_imputed <- random.impute.data.frame(nombreDf_unInputed, c(1,2))
