class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    flash[:notice] = 'Book was successfully created.'
    if @book.save
    redirect_to book_path(@book.id)
    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
      else
      render :edit
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
