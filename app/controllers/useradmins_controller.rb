class UseradminsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  # GET /sivic_estados
  # GET /sivic_estados.json
  def index
    @sivic_users = User.all
  end

  # GET /sivic_estados/1
  # GET /sivic_estados/1.json
  def show
    User.all
  end

  # GET /sivic_estados/new
  def new
    @sivic_user = User.new
  end

  
  def registrar
    redirect_to new_user_session_path
  end

  def create
      @user = User.new(user_params)
      @user.save
      redirect_to root_path
  end  

  # PATCH/PUT /sivic_estados/1
  # PATCH/PUT /sivic_estados/1.json
  def update
    super
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @sivic_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role, :sivic_pessoa_id)
    end
end
