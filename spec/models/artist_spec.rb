require 'rails_helper'

RSpec.describe Artist do
  before(:each) do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Pupple Rain', length: 845, play_count: 8599)
    @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)
    @jgb = Artist.create!(name: 'Jerry Garcia Band')
    @aint_no = @jgb.songs.create!(title: 'Aint No Bread In The Breadbox', length: 540, play_count: 12000)
    @the_harder = @jgb.songs.create!(title: 'The Harder They Come', length: 240, play_count: 120000)
  end

  it {should_not have_many :artist}
  it {should have_many :songs}

  it 'returns all associated songs objects' do
    # require 'pry';binding.pry
    expect(@prince.songs).to eq([@purple, @beret])
  end   
  
  it 'counts number of songs'do
    expect(@prince.song_count).to eq 2
  end

  it 'returns true if the song is associated wiht the artist' do
    expect(@prince.wrote_song?(@purple)).to eq true
  end

  describe 'instance method' do
    describe 'average song length' do
      it 'returns ave. song length for the artist' do
        expect(@prince.average_song_length.round(2)).to eq 755
      end
    end
  end

end