class FitnessPlan < ApplicationRecord
  YOUTUBE_URL_REGEX = /\Ahttps?:\/\/(www\.)?(youtube\.com|youtu\.be)\/.+\z/

  # enums
  enum category: { beginner: 1, expert: 2, pro: 3, custom: 4 }

  # validations
  validates :category, :title, presence: true

  validates :title, length: { minimum: 2, message: "must be at least 2 characters long" }
  validates :content_video_link, format: { with: YOUTUBE_URL_REGEX, message: "must be a valid YouTube URL" }, allow_blank: true

  # associations
  has_many :user_fitness_plans
  has_many :users, through: :user_fitness_plans
end
