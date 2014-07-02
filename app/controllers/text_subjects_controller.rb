class TextSubjectsController < ApplicationController
  def create
    @text_subject = TextSubject.create(text_subject_params)
    shout = current_user.shouts.create(subject_id: @text_subject.id, subject_type: "TextSubject")

    redirect_to :dashboard 
  end

  private

  def text_subject_params
    params.require(:text_subject).permit(
      :body,
    )
  end
end
