class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first, :last, :address]
  end

  def map_json(posts)
    json_data = []
    posts.each do |post|
      json_data << post.as_json(only: [:id,:category, :body, :address, :latitude, :longitude]).merge(count: post.votes.count)
    end
    json_data
  end
end
