class TalksController < ApplicationController
  respond_to :html, :json

  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @talks = Talk.includes(:speaker).order(start: :asc)

    authorize @talks

    respond_with @talks
  end

  def show
    @talk = Talk.find_by(slug: params[:id])
    @title = @talk.title

    authorize @talk

    respond_with @talk
  end

  def new
    @talk = Talk.new
    authorize @talk

    @speakers = Speaker.order(name: :asc)
    @title = "Cadastro de palestra"
  end

  def create
    @talk = Talk.new(talk_params)
    authorize @talk

    @speakers = Speaker.order(name: :asc)
    @title = "Cadastro de palestra"

    if @talk.save
      redirect_to root_path, notice: "Palestra cadastrada com sucesso, nos vemos no evento!"
    else
      render :new
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :description, :start, :finish, :speaker_id, :image)
  end
end
