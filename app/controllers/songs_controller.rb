class SongsController < ApplicationController
  before_action :set_artist
  
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    #GET - /artists/:artist_id/songs
    @songs = @artist.songs.all
  end


  def show
  end

  def new
    @song = @artist.songs.new 
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_song_path(@artist, @song) #need to reference both these ids for this path
    else
      render :new
    end
  end


  def destroy
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

private

  def song_params
    params.require(:song).permit(:title, :artist_name, :album, :rating, :country)
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
  

end
