require 'pry'
class MP3Importer

    attr_accessor :path, :filenames

    def initialize(path)
        @path = path
        @filenames = []
    end

    def files
        Dir.new(self.path).each { |file| @filenames << file if file.length > 4 }
        @filenames
    end

    def import
        self.files.each {|file| Song.new_by_filename(file) }
    end



end
