class TalksController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @talks = Talk.includes(:speaker).order(start: :asc)
  end

  def show
    @talk = Talk.find_by(slug: params[:id])
    @title = @talk.title
  end

  def new
    @talk = Talk.new
    @speakers = Speaker.order(name: :asc)

    @title = "Cadastro de palestra"
  end

  def create
    @talk = Talk.new(talk_params)
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
    params.require(:talk).permit(:title, :description, :start, :finish, :speaker_id)
  end
end
