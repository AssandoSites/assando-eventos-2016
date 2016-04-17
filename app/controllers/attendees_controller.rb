class AttendeesController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
    @attendee = Attendee.new
    @states = CS.states(:br)
    @title = "Inscrição"
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @states = CS.states(:br)
    @title = "Inscrição"

    if @attendee.save
      redirect_to root_path, notice: "Inscrição recebida com sucesso, nos vemos no evento!"
    else
      render :new
    end
  end

  def cities
    @cities = CS.cities(params[:state], (params[:country] || :br))
    render json: { cities: @cities }
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name, :cpf, :email, :phone, :state, :city)
  end
end
