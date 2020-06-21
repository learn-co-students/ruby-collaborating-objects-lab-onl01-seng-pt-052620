require 'pry'

class MP3Importer
    attr_accessor :path 

    def initialize(path)
        @path = path
    end 

    def files
        imported_files = Dir.entries(@path)
        imported_files.select! {|file| file.end_with?("mp3")}
    end

    def import
       files.each {|filename| Song.new_by_filename(filename)}
    end 

end 