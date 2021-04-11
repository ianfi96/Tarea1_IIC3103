class SeasonController < ApplicationController

    def index
        @season = params[:season]
        series = CGI.escape("#{params[:series]}")
        list_of_episodes = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=#{series}").to_s
        parsed_episodes = JSON.parse(list_of_episodes)
        @parsed_season_episodes = []
        parsed_episodes.each do |episode|
            if episode["season"] == @season
                @parsed_season_episodes.append(episode)
            end
        end
    end
end
