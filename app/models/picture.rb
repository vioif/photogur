class Picture < ApplicationRecord
  validates :artist,  presence: true
  validates :title, presence: true
  validates :url,   presence: true

  def validation_purposes
    error.messages [:artist] << "must be present"
    error.messages [:url] << "unique url"
  end

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def pictures_created_in_year(year)
    Picture.year
  end

end
