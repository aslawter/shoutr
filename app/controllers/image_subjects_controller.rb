class ImageSubjectsController < ApplicationController
  def create
    @image_subject = ImageSubject.create(image_subject_params)
    shout = current_user.shouts.create(subject_id: @image_subject.id, subject_type: "ImageSubject")

    redirect_to :dashboard 
  end

  private

  def image_subject_params
    params.require(:image_subject).permit(
      :url,
    )
  end
end
