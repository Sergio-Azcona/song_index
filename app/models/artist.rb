class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    self.songs.average(:length)
  end

  # def songs
  #   # require 'pry';binding.pry
  #   # self.songs.all
  #   Song.where(artist_id: :self.id)
  #   # Song.where(artist_id: id)
  # end

  def song_count
    self.songs.count
  end

  def wrote_song?(song)
    songs.include?(song)
  end

  def average_song_length
    self.songs.average(:length).round(2)
  end

end