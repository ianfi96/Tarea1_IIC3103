class EpisodeController < ApplicationController

    def show
        episode_id = params[:episode_id]
        episode = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/episodes/#{episode_id}").to_s
        parsed_episode = JSON.parse(episode)
        parsed_episode.each do |episode|
            @final_episode = episode
        end
    end
end
