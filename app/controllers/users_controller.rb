class UsersController < ApplicationController

 def show
    @user = User.find(params[:id])
    @books = Book.all
 end

 def index
    @users = User.all
    @user = User.new
 end

 def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
 end

 def edit
    @user = User.find(params[:id])
 end

 def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :new
    end
    flash[:notice] = "You have updated user successfully."
 end

 private

 def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
 end

 def book_params
    params.require(:book).permit(:title, :body, :user_image_id)
 end

 end