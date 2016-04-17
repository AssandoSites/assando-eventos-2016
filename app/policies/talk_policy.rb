class TalkPolicy < ApplicationPolicy
  def create?
    new?
  end

  def new?
    @user.role == 'admin'
  end
end
