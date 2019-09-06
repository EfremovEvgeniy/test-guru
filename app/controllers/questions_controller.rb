class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[destroy show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    #  GET  /tests/:test_id/questions(.:format)
    @questions = @test.questions
    respond_to do |format|
      format.html
      format.xml  { render xml: @questions }
      format.json { render json: @questions }
    end
  end

  def show
    # GET /questions/:id
    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def new
    # GET /tests/:test_id/questions/new(.:format)
    @question= @test.questions.build
  end

  def create
    # POST /tests/:test_id/questions
    if @test.questions.build(question_params).save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def edit
    # GET  /questions/:id/edit(.:format)
    @question
  end

  def update
    # PATCH /questions/:id
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    # DELETE /questions/:id(.:format)
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
