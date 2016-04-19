##
# The Article model is a post on Upworthy: It goes through several stages before it becomes
# published.
#
# Refactor its `send_email` method as best as you can to reduce complexity and improve the
# maintainability of the method. Document any assumptions you make.
#
# Please show all your work. If you have time to set up some plumbing to test your solution,
# please include it.
#
# Time limit: 60 minutes

class Article
  attr_accessor :status_was, :status, :fact_checked
  # I had to alias it because attr_accessor does not allow methods to have "?"
  alias :fact_checked? :fact_checked
  
  def send_email?
    # Send the email only if the article's status changes in these exact ways:
    if self.status_was == :assigned && (self.status == :approved || self.status == :rejected)
      true
    elsif self.status_was == :review && (self.status == :approved || self.status == :rejected)
      true
    elsif self.status_was == :approved && self.status == :rejected
      true
    elsif self.status_was == :rejected && self.status == :approved
      true
    elsif self.status_was != :followup && self.status == :followup && self.fact_checked?
      true
    elsif self.status_was != :review && self.status == :review
      true
    else
      false
    end
  end
end
