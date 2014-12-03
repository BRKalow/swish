class JoiningsController < ApplicationController
  before_action :set_joining

  def accept
    if current_user == @joining.user
      @joining.accepted!
      flash[:success] = "You have joined #{@joining.team.name}!"
      redirect_to team_path @joining.team
    else
      flash[:error] = "This invitation was not mean for you."
      redirect_to :back
    end
  end

  def destroy
    if current_user == @joining.user
      @joining.delete
      flash[:success] = "You have declined the invitation."
      redirect_to :back
    else
      flash[:error] = "This invitation was not mean for you."
      redirect_to :back
    end
  end

  private

  def set_joining
    @joining = Joining.find(params[:id])
  end
end
