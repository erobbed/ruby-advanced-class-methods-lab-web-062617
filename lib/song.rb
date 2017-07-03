require 'pry'

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
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if (self.all.detect {|song| song.name == name}) == nil
      self.create_by_name(name)
    else
      self.all.detect {|song| song.name == name}
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    song.artist_name = filename.split[0]
    song.name = filename.split[2..5].join(" ")[0...-4]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    song = Song.new
    song.artist_name = filename.split[0]
    song.name = filename.split[2..5].join(" ")[0...-4]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
