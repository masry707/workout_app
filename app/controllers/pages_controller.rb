class PagesController < ApplicationController
  def home
    @athletes = User.paginate(page: params[:page])
  end

  def search
    @athletes = User.search_by_name(params[:search_name]).paginate(page: params[:page])
  end
end
