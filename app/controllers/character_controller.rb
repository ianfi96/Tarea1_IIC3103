class CharacterController < ApplicationController

    def show
        character_name = params[:character_name]
        url = CGI.escape("#{character_name}")
        character = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{url}").to_s
        parsed_character = JSON.parse(character)
        parsed_character.each do |ch|
            @character_info = ch
        end
        query_name = CGI.escape("#{character_name}")
        quotes = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/quote?author=#{query_name}").to_s
        @parsed_quotes = JSON.parse(quotes)

    end
end