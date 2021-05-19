require 'pry'

class Song
  attr_accessor :name, :artist_name
      #provides a .name= method and a .name method
  @@all = []
      #@@all will store every instance of the Song class

  def self.all
      #self.all is a class method for reading the data stored in a
      #class variable (i.e. this method will read @@all)
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
      #class constructor is a unique method which is invoked when
      #an object of that particular class is being instantiated
    song = self.new
      #creating an new instance of the Song class
    @@all << song
      #saves the new instance to @@all, which can be called literally
      #or using the .all method (self.all)
    song
      #returns the song instance that was initialized and saved
  end


  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end


  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end
  
  
  def self.find_by_name(song_title)
    self.all.find { |song| song.name == song_title }
  end
  
  
  def self.find_or_create_by_name(song_title)
    search_result = self.find_by_name(song_title)
    if search_result
      search_result
    else
      self.create_by_name(song_title)
    end
  end
  
  
  def self.alphabetical
    abc_sorted = self.all.sort_by { |song| song.name }
    abc_sorted
  end


  def self.new_from_filename(file_name)
    song_array = file_name.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end


  def self.create_from_filename(file_name)
    song_array = file_name.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.create
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  
  
  def self.destroy_all
    self.all.clear
  end
end