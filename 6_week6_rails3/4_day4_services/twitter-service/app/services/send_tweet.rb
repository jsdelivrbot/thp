class SendTweet
    attr_accessor :client, :tweet_text
    
    def initialize(params)
        @tweet_text = params[:tweet]
        log_in_to_twitter
        send_tweet
    end

    def log_in_to_twitter
        @client = Twitter::REST::Client.new do |config|
            # put credentials here
        end
    end

    def send_tweet
          @client.update(@tweet_text)
    end

end