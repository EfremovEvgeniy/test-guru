class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

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
    @questions = @test.questions
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
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    # GET    /tests/:id/edit(.:format)
    @test
  end

  def update
    # PATCH /tests/:id
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    # DELETE /tests/:id(.:format)
    @test.destroy
    redirect_to tests_path
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
