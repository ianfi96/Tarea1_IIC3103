class HomeController < ApplicationController

  def index

    bcs_episodes = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Better+Call+Saul").to_s
    parsed_episodes = JSON.parse(bcs_episodes)
    @bcs_seasons = []
    parsed_episodes.each do |episode|
      @bcs_seasons.append([episode["season"]])
    end
    @bcs_seasons = @bcs_seasons.uniq
    
    bb_episodes = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Breaking+Bad").to_s
    parsed_episodes = JSON.parse(bb_episodes)
    @bb_seasons = []
    parsed_episodes.each do |episode|
      @bb_seasons.append([episode["season"]])
    end
    @bb_seasons = @bb_seasons.uniq

    raise ActionController::RoutingError.new('Not Found') if (@bcs_seasons.blank? || @bb_seasons.blank?)
  end
end
