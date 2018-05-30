class CorsairesController < ApplicationController
  def index
  end

  def new
    @corsaire = Corsaire.new
  end

  def create
    @corsaire = Corsaire.new(corsaire_params)
    if @corsaire.save
      redirect_to @corsaire
    else
        render 'new'
    end
  end

  def edit
    @corsaire = Corsaire.find(params[:id])
  end

  def update
    @corsaire = Corsaire.find(params[:id])
    if @corsaire.update(corsaire_params)
      redirect_to @corsaire
    else
      render 'edit'
    end

  end

  def show
    @corsaire = Corsaire.find(params[:id])
  end

  def corsaire_params
    params.require(:corsaire).permit(:first_name, :age, :likeness, :bio, :slack_handle, :github_handle)
  end

  def index
    @corsaires = Corsaire.all
  end

end
