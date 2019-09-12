class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    if current_user.his_tests.build(test_params).save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit
    @test
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
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
