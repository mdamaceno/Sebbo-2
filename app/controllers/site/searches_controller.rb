class Site::SearchesController < Site::ApplicationController

  before_action :authenticate_user!, only: [:show_per_user]

  respond_to :html

  def index
    if params[:termo].present?
      @searches       = Product.by_term(params[:termo])
      @searches_count = @searches.size
      @searches_term  = params[:termo]
    end
  end

  def show_per_user
    @searches = Search.where(user_id: current_user.id)
  end

  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id if user_signed_in?

    respond_to do |format|
      if @search.save
        format.html { redirect_to searches_path(termo: "#{@search.term}") }
      else
        format.html { redirect_to searches_path(termo: "#{@search.term}") }
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:term, :user_id)
  end
end
