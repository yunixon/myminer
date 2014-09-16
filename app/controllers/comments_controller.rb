class CommentsController < ApplicationController

  load_and_authorize_resource param_method: :comment_params
  before_action :authenticate_user!, only: [:create]
  before_action :find_conf, only: [:create]
  
  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    
    #if @comment.save
    #  render :partial => 'comment', :locals => { :comment => @comment }, :layout => false, :status => :created
    #else
    #  render :js => "alert('error saving comment');"
    #end
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @configuration, notice: 'Comment was successfully created.' }
        format.json { render 'comment', locals: {comment: @comment}, layout: false, status: :created }
        format.js #create.js.haml
      else
        #format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js { "alert('error saving comment');" }
      end
    end
    
  end
  
  private
        
  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :title, :body, :subject, :user_id, :parent_id, :lft, :rqt)
  end
  
  def find_conf
    @configuration = ::Configuration.find(params[:configuration_id])
  end
  
end