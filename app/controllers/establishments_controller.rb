class EstablishmentsController < ApplicationController


  def index
    @establishments = Establishment.all
  end

  def new
    @user = current_user
    @establishment = Establishment.new

  end

  def show
    @establishment = Establishment.find(params[:id])

  end

  def create
    @establishment = Establishment.new(establishment_params)
    @establishment.user = current_user
    if @establishment.save
      redirect_to establishment_path(@establishment)
    else
      render :new
    end

  end

  def edit
    @establishment = Establishment.find(params[:id])
  end

  def update
    @establishment = Establishment.find(params[:id])
    if @establishment.update(establishment_params)
      redirect_to establishment_path(@establishment)
    else
      render :edit
    end
  end

  def destroy
    @establishment = Establishment.find(params[:id])
    @establishment.destroy
    redirect_to "pages#home"
  end


  private



  def establishment_params
    params.require(:establishment).permit(:city, :country, :street, :postal_code, :description, :latitude, :longitude)
  end

end


