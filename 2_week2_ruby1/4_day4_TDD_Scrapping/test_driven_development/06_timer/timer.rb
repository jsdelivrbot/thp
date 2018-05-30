class Timer
  #write your code here

  attr_accessor :seconds

  #Initialize seconds to 0
  def initialize
  	@seconds = 0
  end

  #Define function time string
  def time_string
  	
  	#Define the conversion of the seconds in hours, minutes and seconds
  	hours = seconds/3600
  	minutes = (seconds - hours * 3600)/60
  	sec = (seconds - hours * 3600 - minutes * 60) 

  	#Define the string that will be displayed
  	#String for the hours
  	if hours < 10 
  		hours = "0" + hours.to_s
	else
		hours = hours.to_s
  	end

  	#String for the minutes
  	if minutes < 10 
  		minutes = "0" + minutes.to_s
	else
		minutes = minutes.to_s
  	end
  	#String for the seconds
  	if sec < 10 
  		sec = "0" + sec.to_s
	else
		sec = sec.to_s
  	end  	

  	#Display the time
  	time_display =  hours + ":" + minutes + ":" + sec

  end

end
