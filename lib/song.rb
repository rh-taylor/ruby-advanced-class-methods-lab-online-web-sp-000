class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
 
  def self.create
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
      #instantiating a new song
    song.name = song_name
      #instantiating the new song with name propery
    song
  end
 
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    result = self.find_by_name(song_name)
    if result
      result
    else
      self.create_by_name(song_name)
    end
  end
 
  def self.alphabetical
    abc_sorted = self.all.sort_by { |song| song.name }
    abc_sorted
  end
  
  def self.new_from_filename(filename)
    file_array = filename.split (" - ")
    file_array[1] = file_array[1].chomp(".mp3")
    song = self.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song
  end
    


 
 
 
end