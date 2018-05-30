#write your code here

#Convertir temp en farenheit en celsius
def ftoc (temp_f)

  # S'assurer que la température d'entrée est bien un float
  temp = 0.0

  if temp_f.is_a? Float
	temp = temp_f 
  else
  	temp = temp_f.to_f
  end

  #Retourner la température en degré Celsius
  temp_c = (temp - 32.0) * 5 / 9

end

#Convertir temp en celcius en farenheit
def ctof(temp_c)

  # S'assurer que la température d'entrée est bien un float
  temp = 0.0

  if temp_c.is_a? Float
	temp = temp_c
  else
  	temp = temp_c.to_f
  end

  #Retourner la température en degré F
  temp_f = (temp * 9 / 5) + 32.0

end