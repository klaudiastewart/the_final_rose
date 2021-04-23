class ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestants = @bachelorette.contestants
  end

  def show
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestant = Contestant.find(params[:id])
    @contestant_outings = @contestant.outings
  end
end
