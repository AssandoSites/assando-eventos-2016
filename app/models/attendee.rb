class Attendee < ActiveRecord::Base
  validates :name, :email, :cpf, presence: true
  validates :email, :cpf, uniqueness: true
end
