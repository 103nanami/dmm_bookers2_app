class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def destroy
    @book = Book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_image_id)
  end

end
