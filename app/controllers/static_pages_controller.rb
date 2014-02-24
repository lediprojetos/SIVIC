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
    @sivic_users = User.all
  end

  def relDiscipulos

    @sivic_pessoas = SivicPessoa.all
  end

end
