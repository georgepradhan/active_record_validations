class Event < ActiveRecord::Base

  # a. The events date is empty, in the past, or is not valid.   
  validates :date, presence: true
  validate :date_not_in_past
  # validates :date, #is_valid
  
  # b. The events title is already taken or empty. 
  validates :title, uniqueness: true
  validates :title, presence: true

  # c. The event organizers name is empty. 
  validates :organizer_name, presence: true

  # d. The event organizers email address is invalid.
  validates :organizer_email, format: { with: =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def date_not_in_past
    if :date < Date.today
      errors.add(:date, "is in the past")
    end
  end
end