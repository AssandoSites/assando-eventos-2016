class Talk < ActiveRecord::Base
  validates :title, :description, :start, :finish, presence: true
  validate :start_is_before_finish

  before_save :generate_slug

  private

  def start_is_before_finish
    return if start.blank? || finish.blank?

    errors.add(:finish, 'deve ser após o início da palestra') if finish <= start
  end

  def generate_slug
    self.slug = title.parameterize
  end
end
