require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.shuffle.first(10)
  end

  def score
    @word = params[:word]
    @user_letters = params[:letterlist]
    raise
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_url = open(url).read
    user = JSON.parse(user_url)
    not_valid = user['found'] == false

    if  /@word/.match("#{@user_letters}") == nil
      @score = "Sorry but #{@word} can't be built out of #{@letters}"
    elsif not_valid
      @score = "Sorry but #{@word} does not seem to be a valid English word."
    else
      @score = "Congratulations! #{@word} is a valid Englis word"
    end
  end
end
