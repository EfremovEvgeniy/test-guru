class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    #  GET    /tests(.:format)
    @tests = Test.all
  end

  def show
    # GET    /tests/:id(.:format)
  end

  def new
    # GET    /tests/new(.:format)
    @test = Test.new
  end

  def create
    # POST   /tests(.:format)
    @test = Test.new(test_params)
    @test.author_id = current_user.id

    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit
    # GET    /tests/:id/edit(.:format)
    @test
  end

  def update
    # PATCH  /tests/:id
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    # DELETE /tests/:id(.:format)
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
