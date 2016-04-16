class AttendeesController < ApplicationController
  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)

    if @attendee.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name, :cpf, :email, :phone)
  end
end
