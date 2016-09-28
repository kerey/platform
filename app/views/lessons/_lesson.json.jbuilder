json.extract! lesson, :id, :title, :short_description, :course_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)