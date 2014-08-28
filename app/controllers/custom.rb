class Custom < BaseController

  def index
    test = 'hello universe'
    id = params['id']

    erb :'custom/index', locals: { test: test, id: id }
  end

  def show
    response.body = "Catchall Route"
    response.status_code = 200
  end
end
