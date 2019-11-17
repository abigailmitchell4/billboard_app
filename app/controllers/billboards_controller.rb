class BillboardsController < ApplicationController
 
  before_action :set_billboard, except: [:index, :new, :create]
 
  
  def index
    @billboards = Billboard.all
  end

  def show
    @songs = @billboard.songs
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
  
  def new 
    @billboard = Billboard.new
  end


  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to @billboard #need to reference both these ids for this path
    else
      render :new
    end
  end

  def destroy
    @billboard.songs.update_all(billboard_id: nil)
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


    def billboard_params
      params.require(:billboard).permit(:name)
    end
end
