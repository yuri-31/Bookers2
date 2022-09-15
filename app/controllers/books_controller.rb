class BooksController < ApplicationController
  

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@new_book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @new_book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
