class Bachelorette <ApplicationRecord
  has_many :contestants

  def contestants_average_age
    contestants.
    average(:age)
  end

  def unique_hometowns
    contestants.
    select(:hometown).
    distinct.
    pluck(:hometown)
  end
end
