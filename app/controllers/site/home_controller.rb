class Site::HomeController < Site::ApplicationController

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

end
