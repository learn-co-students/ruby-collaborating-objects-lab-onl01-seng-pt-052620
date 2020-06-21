require 'pry'

class Artist #class name
    attr_accessor :name #creating reader and writer method for 'name'
    @@all = [] #class variable set equal to empty array

    def initialize(name) #initialized with a name
        @name = name #name= method assigned to name 
        @@all << self #adding instance of the Song class to @@all everytime object is created
    end 

    def add_song(song) #instance method that accepts instance of Song class
       new_song = Song.new(song) #creates new song
       song.artist = self #assigns self as #artist in Song class
    end 

    def songs #instance method
        Song.all.select {|song| song.artist == self} #iterates through Song class using @@all class variable. 
        #selects songs that belong to self (intance of artist)
    end 

    def self.find_or_create_by_name(name) #class method taking in name(string) of an artist
        existing_artist = self.all.find {|artist| artist.name == name} #checks to see if artist already exists
        if existing_artist != nil #if there is an existing artist with name
            return existing_artist #returns existing artist
        else 
            return Artist.new(name)  #if there isn't an existing artist with that name, create new artist with that name
        end
    end

    def print_songs #instance method
       songs_array = self.songs #iterates through Song class using @@all variable and selects songs belonging to Artist instance
       songs_array.each do |song|
        puts song.name #puts name of each song to the console
       end 
    end 

    def self.all #class method readder
        @@all
    end 

end 