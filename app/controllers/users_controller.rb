class UsersController < ApplicationController

  before_action :check_user, only:[:edit, :update]

   def show
      @user = User.find(params[:id])
      @book = Book.new
      @books = @user.books
   end

   def index
      @users = User.all
      @user = current_user
      @book = Book.new
   end

   def create
      @book = Book.new
      @book.user_id=current_user.id
      if @book.save
        redirect_to book_path(@book.id)
      else
        render :books/index
      end
   end

   def edit
      @user = User.find(params[:id])
   end

   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
      else
        render :edit
      end
   end

 private

   def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
   end

   def check_user
     @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_path(current_user)
     end
   end

end