require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand (101)
message = ""
secret_number_message = ""

get '/' do
  #Ask a number to the user in order to guess the secret number
  guess_number = params["guess"].to_i

  #verify if the number given by the user is not too high
  message = check_guess(guess_number)
  if message == "You did it bro! You guessed it!"
  	 secret_number_message = "The secret number is #{SECRET_NUMBER}"
  end
  erb :index, :locals => {:message => message, :secret_number_message => secret_number_message}

end

#Check the guess number and display an adapted message on sreen
def check_guess(guess_number)

  if guess_number > 100
  	text = "Too high man! It is above 100"
  elsif guess_number < SECRET_NUMBER && guess_number >= (SECRET_NUMBER - 5)
  	text = "A bit too low :)"
  elsif guess_number < (SECRET_NUMBER - 5)
  		text = "Way too low"
  elsif guess_number > SECRET_NUMBER && guess_number <= (SECRET_NUMBER + 5)
  	text = "A bit too high..."
  elsif guess_number > (SECRET_NUMBER + 5)
  	text = "Way too high"
  elsif guess_number == SECRET_NUMBER
  	text = "You did it bro! You guessed it!"
  end

  text
end