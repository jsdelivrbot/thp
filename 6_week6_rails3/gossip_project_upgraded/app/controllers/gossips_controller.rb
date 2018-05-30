class GossipsController < ApplicationController
  before_action :login_required

  def new
    @gossip = current_mousaillon.gossips.new
  end

  def create
    @gossip = current_mousaillon.gossips.new(gossip_params)
    if @gossip.save
        redirect_to @gossip
    else
        render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
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

  def index
    @gossips=Gossip.all.sort_by {|x| -x[:number_likes]}
    max_like = Gossip.maximum(:number_likes)
    @trending_gossips = Gossip.where(:number_likes => (max_like-1)..max_like).limit(2)
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

    def like
    @gossip = Gossip.find(params[:id])
    if @gossip.likers.include?(current_mousaillon)
        flash.now[:danger] = "You have already liked the gossip"
    else
        @gossip.likers << current_mousaillon
        @gossip.number_likes += 1
        @gossip.save
        flash.now[:success] = "You liked the gossip"

    end
    redirect_to gossips_path
  end

private
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

end
