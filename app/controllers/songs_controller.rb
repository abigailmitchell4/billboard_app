class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    #GET - /artists/:artist_id/songs
    @songs = @artist.songs
  end

  def show
    #GET - /artists/:artist_id/songs/:id
  end

  def new
    #GET	/artists/:artist_id/songs/new
    @song = @artist.songs.new 
    render partial: "form"
  end

  def edit
    #GET	/artists/:artist_id/songs/:id/edit
    render partial: "form"
  end

  def create
    #POST	/artists/:artist_id/songs
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_song_path(@artist, @song) #need to reference both these ids for this path
    else
      render :new
    end
  end

  def update
    #PUT	/artists/:artist_id/songs/:id
    if @song.update(song_params)
      redirect_to artist_song_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    #DELETE	/artists/:artist_id/songs/:id
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

private

  def set_song
    @song = Song.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title, :artist, :album, :rating, :country)
  end

end
