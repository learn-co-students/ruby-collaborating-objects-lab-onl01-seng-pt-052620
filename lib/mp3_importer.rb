require 'pry'

class MP3Importer #class name 
    attr_accessor :path #creating reader/writer for path

    def initialize(path) #initialized with path(file)
        @path = path #assigning instance variable 
    end 

    def files #instance method
        imported_files = Dir.entries(@path) #gets list of files in the @path directory
        imported_files.select! {|file| file.end_with?("mp3")} #selects and returns only files that end with 'mp3'
    end

    def import #instance method
       files.each {|filename| Song.new_by_filename(filename)} #iterates through each file and calls Song Class and #new_by_filname within Song class
    end 

end 