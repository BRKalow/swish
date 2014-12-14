class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new]

  respond_to :html

  def index
    @teams = Team.paginate(page: params[:page], per_page: 10)
    respond_with(@teams)
  end

  def show
    @joining = Joining.new
    gon.users = User.where.not(
      id: @team.members.map(&:id).concat(@team.pending.map(&:id))
    )
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.save
    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  def joining
    user = User.find_by_username(joining_params[:user])
    if !user.nil?
      create_joining user
    else
      flash[:error] = 'We couldn\'t find that player.'
      redirect_to :back
    end
  end

  private

  def set_team
    @team = Team.find_by_permalink(params[:id])
  end

  def create_joining(user)
    @joining = Joining.new
    @joining.team_id = joining_params[:team_id]
    @joining.user = user

    if @joining.save
      flash[:success] = 'An invite has been sent to that player.'
      redirect_to :back
    else
      flash[:error] = 'It looks like something went wrong with your invite.'
      redirect_to :back
    end
  end

  def team_params
    params.require(:team).permit(:name, :picture, :remote_picture_url,
                                 :picture_cache, :location, :website, :owner_id)
  end

  def joining_params
    params.require(:joining).permit(:user, :team_id)
  end
end
