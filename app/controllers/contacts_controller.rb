class ContactsController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    if ContactMailer.welcome(contact_params).deliver
      redirect_to new_contact_path, notice: "Mensagem enviada com sucesso"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
