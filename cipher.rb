require 'sinatra'

require 'sinatra/reloader' if development?

def caesar_cipher(sentence, shift)


  alphabet = ('a'..'z').to_a
  sentence.chars.map do |char|
    index = alphabet.index(char.downcase)
    if index
      shifted_char = alphabet[(index + shift)%26]
      char.downcase == char ? shifted_char : shifted_char.upcase
    else
      char
    end
  end.join("")
end




get '/' do

	par = params.to_s

	output = caesar_cipher(params["text"],params["shift"].to_i)

	erb :index, :locals => {:output => output, :par => par}
end
