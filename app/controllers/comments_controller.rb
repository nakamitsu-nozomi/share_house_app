class CommentsController < ApplicationController
  before_action :set_house, only: [:index, :new, :create, :edit,:update]
  def index
    @comments=Comment.where(house_id:@house.id )
    @comment = Comment.new
  end

  def show
  end

  def new
    @comment=Comment.new
  end

  def create
    @comment=Comment.create(
      title: comment_params[:title],content: comment_params[:content],user_id: current_user.id,house_id: @house.id,type: comment_params[:type],star: comment_params[:star],
      clean_review: comment_params[:clean_review],houserule_review: comment_params[:houserule_review],location_review: comment_params[:location_review],
      com_review: comment_params[:com_review]
    )
    if @comment.save
      redirect_to house_comments_path(house_id:@house.id),notice: "物件を登録しました"
    else
      flash.now[:alert] ="投稿に失敗しました"
      render :new
    end
  end

  def edit
 
  end

  def delete
  end

  def update
    @comment.update(comment_params)
    if @comment.update(comment_params)
      redirect_to house_comments_path(house_id:@house.id),notice: "口コミを編集しました"
    else
      flash.now[:alert] ="編集に失敗しました"
      render :edit
    end
  end

  def destroy
  end



  private
  def comment_params
    params.require(:comment).permit(
      :content,:user_id,:house_id,:type,:star, :title,:clean_review,
      :houserule_review,:location_review,:com_review
    )
  end

  def set_house
    @house = House.find(params[:house_id])
    @comment =Comment.find_by(house_id: params[:house_id])
  end
end
