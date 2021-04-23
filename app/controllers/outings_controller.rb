class OutingsController < ApplicationController
  def show
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestant = Contestant.find(params[:contestant_id])
    @outing = Outing.find(params[:id])
  end
end
