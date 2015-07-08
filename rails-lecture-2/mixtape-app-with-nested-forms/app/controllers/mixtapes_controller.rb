class MixtapesController < ApplicationController

  def new
    @mixtape = Mixtape.new
    100.times do 
      @mixtape.songs.build
    end

  end

  def create
    @mixtape = Mixtape.new(mixtape_params)
    @mixtape.songs_attributes = params[:mixtape][:songs_attributes]

    if @mixtape.save
      raise "You did it! You made #{@mixtape.name}"
    else
      render :new
    end
  end

  private
    def mixtape_params 
      # https://github.com/rails/strong_parameters#nested-parameters
      params.require(:mixtape).permit(:name, :songs_attributes => [:title])
    end
end

