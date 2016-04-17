class AttendeesController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
    @attendee = Attendee.new
    @title = "Inscrição"
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @title = "Inscrição"

    if @attendee.save
      redirect_to root_path, notice: "Inscrição recebida com sucesso, nos vemos no evento!"
    else
      render :new
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name, :cpf, :email, :phone)
  end
end
