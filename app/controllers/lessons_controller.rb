class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_users, only: [:show]


  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def course
    @course = current_lesson.section.course
  end

  def require_enrolled_users
    if !current_user.enrolled_in?(course)
      redirect_to course_path(course), alert: 'You must be enrolled in this Course in order to view the Lessons.'
    end
  end
end
