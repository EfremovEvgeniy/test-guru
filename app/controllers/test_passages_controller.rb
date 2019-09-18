class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

    if result.success?
      @gist = Gist.new(question_id: @test_passage.current_question.id, user_id: @test_passage.user.id,
                       url: result.service[:html_url])
      @gist.save
      flash[:notice] = t('.success', link_to_gists: @gist.url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
