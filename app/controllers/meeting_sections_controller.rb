class MeetingSectionsController < ApplicationController

  def search
    section = params[:section] || nil
    sections = []
    sections = MeetingSection
      .find(section) if section

    render json: sections

  end

end
