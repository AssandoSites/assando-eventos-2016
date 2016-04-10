class TalksController < ApplicationController
  def index
    @talks = Talk.order(start: :asc)
  end

  def show
    @talk = Talk.find_by(slug: params[:id])
  end
end
