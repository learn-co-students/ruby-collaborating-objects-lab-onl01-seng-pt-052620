class Song

    attr_accessor :name, :artist
    attr_reader :artist_name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
    end


    def self.all
        @@all 
    end 

    def self.new_by_filename(file_name)
        artist_name, name = file_name.chomp('.mp3').split(' - ')
        song = self.new(name)
        song.artist_name = artist_name
        song
    end

    def artist_name=(artist_name)
        @artist = Artist.find_or_create_by_name(artist_name)
    end   
end
