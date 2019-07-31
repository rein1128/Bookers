class BooksController < ApplicationController
      before_action :authenticate_user!
      before_action :correct_book, only: [:edit, :destroy]
 

  def show
  	@bookn = Book.new
  	@book = Book.find(params[:id])
    @user = current_user
  end

  def index
    @bookn = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @bookn = Book.new(book_params)
    @bookn.user_id = current_user.id
    if @bookn.save
       flash[:notice] = "You have creatad book successfully."
       redirect_to book_path(@bookn.id)
    else
       @user = current_user
       @books = Book.all
       render("index")

    end
  end

  def top
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render("edit")
    end
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def correct_book
      @book=Book.find(params[:id])
      if @book.user != current_user
        redirect_to books_path
      end
    end
end
