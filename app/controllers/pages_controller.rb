class PagesController < ApplicationController
  def home
    @athletes = User.paginate(page: params[:page])
  end
end
