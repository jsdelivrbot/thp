class MovieSearch

    attr_accessor :movie_searched, :search, :search_results

    def initialize(movie_searched)
        @movie_searched = movie_searched.to_s
        connect_to_api
        get_movies_details
        build_search
    end

    def connect_to_api
        Tmdb::Api.key("331057ce5dcbf1373c63234af2e283cd")
    end

    def get_movies_details
        @search_results=Tmdb::Movie.find(@movie_searched)
    end

    #Organise results into the seach attribute
    def build_search
        @search=[]
        @search_results.each do |r|
            @search << MovieStandardized.new(r)
        end
    end
end