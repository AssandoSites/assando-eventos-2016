class ContactMailer < ApplicationMailer
  def welcome(params = {})
    @name = params[:name]
    @message = params[:message]

    mail(from: params[:email], to: 'atendimento@assando-sites.com.br', subject: "Contato - #{@name}")
  end
end
