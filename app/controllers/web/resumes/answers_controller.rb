# frozen_string_literal: true

class Web::Resumes::AnswersController < Web::Resumes::ApplicationController
  def edit
    @answer = resource_resume.answers.find params[:id]
  end

  def update
    @answer = resource_resume.answers.find params[:id]
    if @answer.update(resume_answer_params)
      f(:success)
      redirect_to resume_path(resource_resume)
    else
      render :edit
    end
  end

  def create
    @answer = resource_resume.answers.build resume_answer_params
    @answer.user = current_user
    if @answer.save
      f(:success)
      redirect_to resume_path(resource_resume)
    else
      render :new
    end
  end

  def destroy
    resume = Resume.find params[:resume_id]
    # TODO: add pundit, switch to resume, check current user
    answer = current_user.resume_answers.find(params[:id])
    answer.destroy

    f(:success)
    redirect_to resume_path(resume)
  end

  def resume_answer_params
    params.require(:resume_answer).permit(:content)
  end
end
