# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactMailerPreview < ActionMailer::Preview
  def welcome
    params = { email: 'fulano@example.com', name: 'Fulano', message: 'Olá mundo' }
    ContactMailer.welcome(params)
  end
end
