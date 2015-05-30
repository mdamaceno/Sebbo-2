class Site::SearchesController < Site::ApplicationController

  respond_to :html

  def index
    if params[:termo].present?
      @searches       = Product.by_term(params[:termo])
      @searches_count = @searches.size
      @searches_term  = params[:termo]
    end
  end

  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id if user_signed_in?

    respond_to do |format|
      if @search.save
        format.html { redirect_to searches_path(termo: "#{@search.term}") }
      else
        format.html { render :index }
      end
    end
  end

  def search_params
    params.require(:search).permit(:term, :user_id)
  end
end
