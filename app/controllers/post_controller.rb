class PostController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @boards = Board.all.reverse
  end
  
  def new
  end
  
  def create
    @title = params[:title]
    @content = params[:content]
    
    # DB에 저장
    @board = Board.new
    @board.title = @title
    @board.content = @content
    @board.save
    
    # root 페이지로 이동
    redirect_to '/'
  end
  
  def show
    @board = Board.find(params[:id])
  end
  
  def destroy
    Board.find(params[:id]).destroy
    
    # root 페이지로 이동
    redirect_to '/'
  end
end
