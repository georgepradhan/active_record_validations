class Event < ActiveRecord::Base

  # a. The events date is empty, in the past, or is not valid.   
  validates :date, presence: true
  validate :foo_not_in_past # can be named whatever
  # validate :date_is_valid -- html takes care of this

  # b. The events title is already taken or empty. 
  validates :title, uniqueness: true
  validates :title, presence: true

  # c. The event organizers name is empty. 
  validates :organizer_name, presence: true

  # d. The event organizers email address is invalid.
  validates :organizer_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def foo_not_in_past
    # date (not in the form of a :symbol)
    # is an instance variable (and getter method)
    # that refers to the date of the Event object...
    if self.date < Date.today
      errors.add(:foo, "is in the past") # can add whatever to errors
    end
  end

end
