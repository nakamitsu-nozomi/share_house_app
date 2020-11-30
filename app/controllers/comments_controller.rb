class CommentsController < ApplicationController
  before_action :authenticate_user! ,except: :index
  before_action :set_house
  def index
    @comments=Comment.where(house_id:@house.id ).order(id: "DESC")
    @comment = Comment.new
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
      redirect_to house_comments_path(house_id:@house.id),notice: "口コミを登録しました"
    else
      flash.now[:alert] ="入力内容に不備があります。確認してもう一度送信してください。"
      render :new
    end
  end

  def edit
    @comment =Comment.find( params[:id])
  end


  def update
    @comment =Comment.find( params[:id])
    @comment.update(comment_params)
    if @comment.update(comment_params)
      redirect_to house_comments_path(house_id:@house.id),notice: "口コミを編集しました"
    else
      flash.now[:alert] ="入力内容に不備があります。確認してもう一度送信してください。"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to house_comments_path(house_id:@house.id),alert: "口コミを削除しました"
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
  end
end
