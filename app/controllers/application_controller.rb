class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :set_search

  def set_search
    @q = Beach.ransack(params[:q]) 
    @result = @q.result.page(params[:page]).per(5).order('created_at DESC') 
  end
  
  def after_sign_in_path_for(resource) 
　　beaches_path
  end
end
