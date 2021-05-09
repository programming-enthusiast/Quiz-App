class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz
  before_action :set_question
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    authorize @question, :show?
    @answers = @question.answers
  end

  def show
  end

  def new
    authorize @answer = @question.answers.build
  end

  def edit
  end

  def create
    authorize @answer = @question.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html {
          redirect_to quiz_question_answers_url(@question.quiz, @question),
                      notice: 'Answer was successfully created.'
        }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html {
          redirect_to quiz_question_answers_url(@question.quiz, @question),
                      notice: 'Answer was successfully updated.'
        }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html {
        redirect_to quiz_question_answers_url(@question.quiz, @question),
                    notice: 'Answer was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:question_id])
  end

  def set_answer
    authorize @answer = @question.answers.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:text, :correct)
  end
end
