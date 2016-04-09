class PagesController < ApplicationController
  def home
    @date = Date.today
  end
end
