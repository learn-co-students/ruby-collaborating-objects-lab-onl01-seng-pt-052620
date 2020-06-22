require 'pry'

class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir["#{@path}/*.mp3"].collect { |file| file.sub(/.*\/+/, '') }

  end

  def import
    imported_files = self.files
    imported_files.collect do |file|
      new_song = Song.new_by_filename(file)
    end    
  end


end