################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
#didn't really have time to get as far as I wanted with this... please bear with
#the messy code. I know there are some unnecessary lines of code in here and I 
#did not spend enough time to make this as functional as I would have liked.
################################################################################
################################################################################
#my primary goal was to write something that I would actually use, every day.
#this concept is called "CloudDig"... I have many features in mind to build in..
#high level structure:
#users :name, :email addess (eventually :friends, :friends_email_addresses)
#users create "Crates of music" which is really just a fancy way of packaging 
#download links. A user has a number of crates... Each crate has a name..
#read: genre/playlist name..... Each crate has a number of Artists. Each artist
#has an artist name, and free download links courtesy of soundcloud api.
#eventually, 
#create & persist multiple users
#create & persist users many crates
#create & persist crates many artists, and associated information/links
#build in share functionality to email yourself links
################################################################################
################################################################################
################################################################################

require "soundcloud"
require "pry"

require_relative 'lib/user'
require_relative 'lib/crate'
require_relative 'lib/artist'

client = Soundcloud.new({:client_id => 'f2929538d2dd3dae3a21abef07884aba',
                        :client_secret => '2d7f860d7222e9b96dabb8c4b98a0b34',
                        :username => 'clouddig',
                        :password => 'clouddigmid12'})

def line_break
  puts "=============================================="
end


def rules
  puts "1. create usernames"
  puts "2. name your crates & add artists to each crate"
  puts "3. get downloads from your crates"
  puts "..........we'll walk you through everything :P"
end

def create_user
  puts '--------------New CloudDig User----------------------'
  puts "enter username"
    line_break
    user_name = gets.strip
    line_break
  puts "created user #{user_name}"
  line_break
  puts "enter email address"
    line_break
    user_email = gets.strip
  User.new(user_name, user_email)
end


def create_crate
  puts '------------------New CloudCrate-----------------'
  puts "enter crate name.........."
    line_break
    crate_name = gets.downcase.strip
    line_break
  puts "okay created new crate #{crate_name}"
    line_break
  puts "how many artists?"
  #this should probably be elsewhere so I can iterate through later......
    line_break
    artists_number = gets.downcase.strip
    line_break
  #if you're iterating... don't put this next line... or fix the order in which crates are created and subsequently populated
    puts "okay! now let's start adding!"
    line_break

  Crate.new(crate_name, artists_number)
#make this so you can add up to 5, but not more than (crate gets full to encourage making new crates.
#maybe add email of friend who its for...so later you can send links to friends to download your crate
end

def create_artist
  puts '-----------New CloudCrate Artist-----------------'
    line_break
  puts "enter a soundcloud artist's username"
  artist_name = gets.strip
    line_break
  client = Soundcloud.new({:client_id => 'f2929538d2dd3dae3a21abef07884aba',
                        :client_secret => '2d7f860d7222e9b96dabb8c4b98a0b34',
                        :username => 'clouddig',
                        :password => 'clouddigmid12'})

#there is also some other cool shit in the API here to add....
  
  download_links = client.get("/users/#{artist_name}/favorites").map do |track|
      if track['downloadable']
        track['permalink_url']
      end
    end.compact

  puts "Okay, added #{artist_name} to the crate!"
  Artist.new(artist_name, download_links)
end

#######################################################
#######################################################

puts "**********************************************"
puts "*************Welcome to CloudCrate************"
puts "**********************************************"
  line_break
puts "Hi there! Let's get started right away!"
  line_break
rules
  line_break

user = create_user

puts "How many crates?"
crate_count = gets.to_i

1.upto(crate_count) do |crate|

  crates = create_crate
  user.crates << crates
end

artist = create_artist

###### ADD Artist iteration....
###### fix the messy inheritance
###### ADD PAGINATION so we can loop thru hundreds of likes and get links
###### "EXPLORE" navigate to other users favorites..
puts "Here is your crate demo"

artist.view_cratecontents

puts "thanks for trying out the beta!"

#example input...
#enter username : username
#enter email : whatever@whatever.com
#how many crates? : 2
#enter crate name : First
#how many artists : 2
#enter crate name : second
#how many artists : 1
#enter a soundcloud artists username : kartell






