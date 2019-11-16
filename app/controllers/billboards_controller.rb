class BillboardsController < ApplicationController
  # before_action :set_song, only: [:show, :edit, :update, :destroy, :new_song, :add_song, :remove_song]
  before_action :set_billboard, except: [:index, :new, :create]
  # before_action :set_billboard, only: [:show, :edit, :update, :destroy, :new_song]
  
  def index
    @billboards = Billboard.all
  end

  def show
    # @songs = Song.all
    @songs = @billboard.songs
  end

  def new 
    @billboard = Billboard.new
  end

  def create
    #POST	/artists/:artist_id/songs
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to @billboard #need to reference both these ids for this path
    else
      render :new
    end
  end

  def edit
  end

  def update 
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else 
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  def new_song
    @songs = Song.all.where(billboard_id: nil)
  end

  def add_song
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

  private

    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    # def set_song
    #   @song = Song.find(params[:id])
    # end

    # def song_params
    #   params.require(:song).permit(:title, :artist_name, :album, :rating, :country)
    # end

    def billboard_params
      params.require(:billboard).permit(:name)
    end
end
