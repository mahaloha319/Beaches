class BeachesController < ApplicationController
  before_action :set_beach, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:new, :show, :edit]
  
  def index
    @beaches = Beach.order(:created_at).reverse_order
    @beaches = Beach.page(params[:page]).per(6).order('created_at DESC')
    @q = Beach.ransack(params[:q]) 
    @result = @q.result.page(params[:page]).per(6).order('created_at DESC') 
    
  end
  
  def new
    if params[:back]
      @beach = current_user.beaches.new(beach_params)
    else
      @beach = current_user.beaches.new
    end  
  end 
  
  def create
    @beach = Beach.new(beach_params)
    @beach.user_id = current_user.id
    @beach.image.retrieve_from_cache! params[:cache][:image] if params[:cache][:image].present?
      if @beach.save
        redirect_to beaches_path, notice:"post completed!"
      else
       render 'new'
      end
  end 
  
  def show
    @like = current_user.likes.find_by(beach_id: @beach.id)
    @likes_count = Like.where(beach_id: @beach.id).count
  end
  
  def top5
    @top5 = Beach.find(Like.group(:beach_id).order('count(beach_id) desc').limit(5).pluck(:beach_id))
  end
  
  def edit
  end
  
  def update
    if @beach.update(beach_params)
      redirect_to beaches_path, notice: "post edited!"
    else
      render 'edit'
    end  
  end  
  
  def destroy
    @beach.destroy
    redirect_to beaches_path, notice:"post deleteed!"
  end  
  
  def like
    @like = current_user.likes.find_by(beach_id: params[:beach_id])
  end 
 
  def confirm
    @beach = current_user.beaches.new(beach_params)
    render :new if @beach.invalid?
  end  
  
  private
  def beach_params
    if params[:beach]
      params.require(:beach).permit(:name, :address, :information, :image)
    else false
    end
  end
  
  def set_beach
    @beach = Beach.find_by_id(params[:id])
  end  
end