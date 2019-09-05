class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    #  GET    /tests(.:format)
    @tests = Test.all
    respond_to do |format|
      format.html
      format.xml  { render xml: @tests }
      format.json { render json: @tests }
    end
  end

  def show
    # GET    /tests/:id(.:format)
    respond_to do |format|
      format.html
      format.json { render json: @test }
    end
  end

  def new
    # GET    /tests/new(.:format)
    @test = Test.new
  end

  def create
    # POST   /tests(.:format)
    @test = Test.create(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end
