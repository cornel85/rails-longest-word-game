require 'net/http'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = generate_code(10)

  end

  def score
    # @output = params[:score]
    user_word = params[:score]
    letters = params[:letters]
    api_contacter(user_word)
    compare_letters(letters, user_word)
  end

  def generate_code(number)
    charset = Array('A'..'Z') # + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

  def api_contacter(input)
    url = "https://wagon-dictionary.herokuapp.com/#{input}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    content = JSON.parse(response)
    if content['found']
      @judgement = 'Valid English word.'
    else
      @judgement = 'This is no valid English word.'
    end

    def compare_letters(letters, user_word)
      test = (user_word.chars - letters.chars)


      if (test) == letters.chars
        @judgement2 = "Goood"
      else
        @judgement2 = "Not good"
        gem pry-byebug
      end
    end



    # gem 'pry-byebug'
  end

end
