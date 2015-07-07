class MixtapesController < ApplicationController

  def new
    @mixtape = Mixtape.new
  end

  def create
    @mixtape = Mixtape.new(mixtape_params)

    if @mixtape.save
      raise "You did it! You made #{@mixtape.name}"
    else
      render :new
    end
  end

  private
    def mixtape_params 
      params.require(:mixtape).permit(:name)
    end
end

