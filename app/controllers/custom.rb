class Custom < BaseController

  def index
    # response.body = "<h1>Hello World</h1>"
    response.status_code = 200
  end

  def show
    response.body = "Catchall Route"
    response.status_code = 200
  end
end
