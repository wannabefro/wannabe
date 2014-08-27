class Custom < BaseController

  def index
    response.body = "Hello World"
    response.status_code = 200
  end

  def show
    response.body = "Catchall Route"
    response.status_code = 200
  end
end
