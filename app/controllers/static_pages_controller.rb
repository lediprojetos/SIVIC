class StaticPagesController < ApplicationController

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def index
    @sivic_users = User.paginate(:page => params[:page], :per_page => 10)
  end

end

