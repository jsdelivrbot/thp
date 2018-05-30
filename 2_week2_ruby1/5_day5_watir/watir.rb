require 'watir'
require 'watir-webdriver'
require 'watir-scroll'
 
def search_google_text(text)

	browser.goto 'google.com'

	search_bar = browser.text_field(class: 'gsfi')
	search_bar.set(text)

	#Option 1 to launch the google search, push the button "Enter"
	search_bar.send_keys(:enter)
	#NOT WORKING - Option 2 to launch the google search, use the glassmagnifier
	#submit_button = browser.button(type:"submit")
	#submit_button.click

	sleep(5)

	browser.close
 
end

def scroll_down (url_page)

	browser = Watir::Browser.new(:firefox)
	browser.goto(url_page)

	i =0
	while i<10 
		browser.execute_script("window.scrollBy(")
		i += 1
	end

	browser.close

end

#search_google_text("Une souris verte")

scroll_down("http://www.onemilescroll.com/")