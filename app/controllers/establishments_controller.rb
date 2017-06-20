class EstablishmentsController < ApplicationController

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
    @establishment.update(establisment_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to establishment_path(@establishment)

  end

  def destroy
    @establishment = Establishment.find(params[:id])
    @establishment.destroy
    redirect_to establishments_path
  end

  def edit
        @establishment = Establishment.find(params[:id])


  end

end
