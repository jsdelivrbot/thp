class MousaillardsController < ApplicationController
  
  def index
    @mousaillards=Mousaillard.all
  end

  def show
    @mousaillard = Mousaillard.find(params[:id])
    @gossips = @mousaillard.gossips
    @gossip = Gossip.new(mousaillard_id:params[:id], author:params[:username])
  end

  def new
    @mousaillard =Mousaillard.new
  end

  def create
    @mousaillard = Mousaillard.new(mousaillard_params)
    if @mousaillard.save
      redirect_to @mousaillard
    else
      render 'new'
    end
  end

  def edit
     @mousaillard = Mousaillard.find(params[:id])
  end

  def update
      @mousaillard = Mousaillard.find(params[:id])
     if @mousaillard.update(mousaillard_params)
      redirect_to @mousaillard
    else
      render 'edit'
    end
  end

  def destroy
    @mousaillard = Mousaillard.find(params[:id])
    @mousaillard.destroy

    redirect_to mousaillards_path
  end

  def mousaillard_params
    params.require(:mousaillard).permit(:bio, :username, :email)
  end


end
