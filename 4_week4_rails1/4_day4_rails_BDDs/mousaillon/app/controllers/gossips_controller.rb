class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @mousaillard = Mousaillard.find_by_id(@gossip[:mousaillard_id])
  end

  def new
     #@mousaillard = Mousaillard.find(params[:id])
    # puts @mousaillard
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.save
    @mousaillard = Mousaillard.find_by_id(@gossip[:mousaillard_id])
    redirect_to @mousaillard
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
     if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy

    redirect_to gossips_path
  end

  def gossip_params
    params.require(:gossip).permit(:content, :mousaillard_id, :author)
  end
end
