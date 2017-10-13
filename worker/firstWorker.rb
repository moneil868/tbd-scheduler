require 'httparty'
require '../config/environment.rb'

skip = 0

while skip < 15800
  response = HTTParty.get("http://localhost:4242/1.0/courses?limit=100&skip=#{skip}")
  parsed_reponse = JSON.parse(response.body)

  parsed_reponse.each do |course|
    new_course = Course.new(code: course["code"], name: course["name"], description: course["description"], department: course["department"], level: course["level"], campus: course["campus"], term: course["term"])
    if new_course.save!

       course["meeting_sections"].each do |meeting|
         new_meeting = new_course.meeting_sections.new(code: meeting["code"], size: meeting["size"])

         if new_meeting.save!

           meeting["times"].each do |time|
             new_time = new_meeting.course_times.new(day: time["day"], start: time["start"], end: time["end"], duration: time["duration"], location: time["location"])
             new_time.save!
           end

           meeting["instructors"].each do |instructor|
             new_instructor = new_meeting.instructors.new(name: instructor)
             new_instructor.save!
           end

         end

      end
    end

  end





  skip += 100
end


# {"id"=>"ABP100Y1Y20169", "code"=>"ABP100Y1Y", "name"=>"Intro to Academic Studies", "description"=>"", "division"=>"Faculty of Arts and Science", "department"=>"Woodsworth College (WDW) (ABP)", "prerequisites"=>"", "exclusions"=>"", "level"=>100, "campus"=>"UTSG", "term"=>"2016 Fall", "meeting_sections"=>[{"code"=>"L0101", "size"=>30, "enrolment"=>0, "times"=>[{"day"=>"TUESDAY", "start"=>36000, "end"=>46800, "duration"=>10800, "location"=>""}], "instructors"=>["C Shook"]}], "breadths"=>[]}
