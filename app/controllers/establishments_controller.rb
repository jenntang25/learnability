class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]


  def index
    @establishments = Establishment.all
    @establishments = policy_scope(Establishment).order(created_at: :asc)
    #the order should be by proximity
  end

  def new
    @user = current_user
    @establishment = Establishment.new
    authorize @establishment

  end

  def show
    authorize @establishment

  end

  def create
    @establishment = Establishment.new(establishment_params)
    @establishment.user = current_user
    authorize @establishment

    if @establishment.save
      redirect_to establishment_path(@establishment)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @establishment.update(establishment_params)
      redirect_to establishment_path(@establishment)
    else
      render :edit
    end
  end

  def destroy
    @establishment.destroy
    redirect_to "pages#home"
  end

  private

  def set_establishment
  @establishment = Establishment.find(params[:id])
  authorize @establishment
  end


def establishment_params
  params.require(:establishment).permit(:city, :country, :street, :postal_code, :description, :latitude, :longitude)
end

end


