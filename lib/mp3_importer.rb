require 'pry'
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = [] #creates variable files with an empty array
    Dir.new(self.path).each do |file| #WHAT IS PATH? iterates through new directory taking self.path as argument
      #puts each file from the directory into the files array
      files << file if file.length > 4
    end
    files
  end

  def import
    self.files.each do |filename| #goes through the files array and takes each filename, then makes a new song
      #with that filename using new_by_filename method from the Song class.
      Song.new_by_filename(filename)
    end
  end
end
