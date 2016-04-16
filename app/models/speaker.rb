class Speaker < ActiveRecord::Base
  has_many :talks

  validates :name, :email, presence: true

  def gravatar
    hash = Digest::MD5.hexdigest(email)
    "http://gravatar.com/avatar/#{hash}"
  end
end
