class QuestionsController < ApplicationController
  include SetSession
  include SaveAllQuestions

  def index
    set_session
    @session_started = session[:last_time]

    @questions = Question.get_unanswered(session[:lang], session[:last_time]).map { |u| { category: u.category, id: u.id } }
    if @questions.length == 0
      redirect_to no_questions_path
    end
  end

  def no_questions; end

  def export
    save_all_questions
    respond_to do |format|
      format.js
    end
  end

  def get_question
    @question = Question.find_by(id: params[:id])
    if request.xhr?
      render json: { question_content: @question.question, answer_content: @question.answer}
    end
  end

  def mark_question_as_answered
    Answer.create(question_id: params[:id], session_id: session[:last_time])
    respond_to do |format|
      format.js { head :ok }
    end
  end

  def toggle_language
    session[:lang] == 'JQuery' ? session[:lang] = 'RoR' : session[:lang] = 'JQuery'

    respond_to do |format|
      format.js
    end
  end

  def send_message
    doc = GeneratePdf.new
    doc.create_content(session[:last_time])
    doc.render_file 'qa.pdf'
    ApplicationMailer.send_message(params[:address]).deliver

    respond_to do |format|
      format.js { head :ok }
    end
  end
end
