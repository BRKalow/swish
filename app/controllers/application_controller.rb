class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :determine_layout

  protected

  def determine_layout
    if devise_controller? && resource_name == :user && action_name == "new"
      "login"
    else
      "application"
    end
  end
end
