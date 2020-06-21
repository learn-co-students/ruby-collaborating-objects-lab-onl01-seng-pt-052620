require 'pry'

class Song #class name
    attr_accessor :name, :artist #creating reader and writer for :name and :artist
    @@all = [] #class variable set equal to empty array

    def initialize(name) #initialized with a name
        @name = name #name= method assigned to name 
        @@all << self #adds instance of Song class to @@all everytime object is created
    end 

    def self.new_by_filename(filename) #class method accepting filename argument 
        new_song = Song.new(filename.split("-")[1].strip) #creating new song using the filename
        new_song.artist = Artist.new(filename.split("-")[0].strip) #assigning artist attribute to new instance of Artist
        new_song #return new_song
    end 

    def artist_name=(name) #instance method, writer that accepts artist name 
       existing_artist = Artist.all.find {|item| item.name == name} #iterates through Artist class variable @@all and trys to find if an artist name equal to the artist name given
       if existing_artist == nil #if there is not an existing artist
            self.artist = Artist.new(name) #assigns artist attribute of this instance to a new instance of Artist
       else
            self.artist = existing_artist #if artist does exist, assigns artist attribute of this instance to instance of Artist 
       end 
    end 

    def self.all #class method reader to access class variable @@all
        @@all
    end 

end 
