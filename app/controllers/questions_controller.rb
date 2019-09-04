class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show create]
  before_action :find_question, only: %i[destroy]

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
    # GET /tests/:test_id/questions/:id
    question = @test.questions.where('questions.id = ?', params[:id])
    render xml: question
  end

  def new
    # GET /tests/:test_id/questions/new(.:format)
  end

  def create
    # POST /tests/:test_id/questions
    # question = Test.find(params[:test_id]).questions.build(question_params).save
    question = @test.questions.build(question_params).save
    render plain: question.inspect
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
