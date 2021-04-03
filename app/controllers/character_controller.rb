class CharacterController < ApplicationController

    def show
        character_name = params[:character_name]
        @no_exists = false
        url = CGI.escape("#{character_name}")
        character = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{url}").to_s
        if character != "[]"
            parsed_character = JSON.parse(character)
            parsed_character.each do |ch|
                @character_info = ch
            end   
        else
            new_name = character_name.split
            character = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{new_name[0]}").to_s
            parsed_character = JSON.parse(character)
            parsed_character.each do |ch|
                @character_info = ch
            end
        end
        if character == "[]"
            @no_exists = true
        else
            query_name = CGI.escape("#{character_name}")
            quotes = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/quote?author=#{query_name}").to_s
            @parsed_quotes = JSON.parse(quotes)
        end
    end

    def index

        text_to_search = params[:search]
        query_text = CGI.escape("#{text_to_search}")
        offset = 0
        @list_of_characters=[]
        names = ""
        while names != "[]"
            names = HTTP.get("https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{query_text}&offset=#{offset}").to_s
            parsed_query = JSON.parse(names)
            parsed_query.each do |character|
                @list_of_characters.append(character)
            end
            offset += 10
        end
    end

end
