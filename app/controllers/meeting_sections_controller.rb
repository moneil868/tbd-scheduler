class MeetingSectionsController < ApplicationController

  def search
    section = MeetingSection
      .find(params[:section])

    course_times = section.course_times.map { |time| {
      start: time.start,
      end: time.end,
      day: time.day
      } }

    render json: {
      courseCode: section.course.code,
      sectionCode: section.code,
      instructors: section.instructors.pluck('name'),
      courseTimes: course_times,
      term: section.course.term
    }

  end
end
