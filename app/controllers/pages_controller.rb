class PagesController < ApplicationController
  def home
    @athletes = User.all
  end
end
