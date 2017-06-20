class EstablishmentsController < ApplicationController
  before_action :set_establishment

  def new
    @establishment = Establishment.new

  end

  def show
    @establishment = Establishment.find(params[:id])

  end

  def create
    @establishment = Establishment.new(establishment_params)
    @establishment.user = current_user
    if @establishment.save
      redirect_to establishments_path(@establishment)
    else
      render :new
    end

  end

  def update
    @establishment = Establishment.find(params[:id])
    if @establishment.update(establisment_params)
      redirect_to establishment_path(@establishment)
    else
      render :edit
    end
  end

  def destroy
    @establishment = Establishment.find(params[:id])
    @establishment.destroy
    redirect_to establishments_path
  end

  def edit
  end

  private

  def set_establishment
    @establishment = Establishment.find(params[:id])
  end

  def establishment_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:establishment).permit(:city, :country, :street, :postal_code, :description, :latitude, :longitude)
  end

end
