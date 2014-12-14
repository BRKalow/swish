class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find_by_permalink(params[:id])

    @snippets = @user.snippets.paginate(page: params[:s_page], per_page: 10)
    @collections = @user.collections.paginate(page: params[:c_page], per_page: 10)
  end
end
