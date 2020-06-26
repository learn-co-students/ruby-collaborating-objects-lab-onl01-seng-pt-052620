class Artist
  attr_accessor :name, :songs

  @@all = [] #stores all instances of Artist

  def initialize(name) #initializes new instance of Artist class
    @name = name #sets name of artist to instance variable
    save #calls save method
  end

  def self.all #method operates on Artist class
    @@all #returns class variable (array of all instances of Artist)
  end

  def save
    @@all << self #operates on instance of Artist class; puts instance into @@all array
  end

  def add_song(song) #used to add a new song; operating on instance of Artist
    song.artist = self #self = artist (like beyonce). this assigns the artist as the artist
    #of the song. ex. lemonade.beyonce = self(beyonce). beyonce is the artist of the song lemonade.
  end

  def songs #returns array of all songs that belong to this instance of Artist (ex. beyonce)
    Song.all.select {|song| song.artist == self} #iterates through ALL the songs ever and
    #selects only the songs where the song's artist
  end

  def self.find(name) #to find a song with a particular name
    self.all.detect {|artist| artist.name == name} #iterates through the Artist class and tries
    #to find an instance with a particular name (ex. beyonce).
  end

  def self.create(name) #to create instance of artist if it doesn't exist
    artist = Artist.new(name) #initializes new instance of artist
    artist #returns the new artist object
  end

  def self.find_or_create_by_name(name)
    if self.find(name) #if the artist is found...
      self.find(name) #returns that artist
    else
      self.create(name) #if the artist is not found, calls create method
    end
  end

  def print_songs #prints a list of all beyonce's songs
    Song.all.each {|song| puts song.name if song.artist == self} #iterates through
    #all the songs ever and prints the ones that are made by beyonce
  end
end
