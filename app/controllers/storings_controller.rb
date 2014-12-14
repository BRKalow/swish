class StoringsController < ApplicationController
  before_action :set_storing

  def destroy
  end

  private

  def set_storing
    @storing = Storing.find(params[:id])
  end
end
