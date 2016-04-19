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
    if approved_status? && rejected_status?
      true
    elsif was_assigned_or_reviewed? && approved_or_rejected?
      true
    elsif followup? && self.fact_checked?
      true
    elsif reviewed?
      true
    else
      false
    end
  end

  def approved_or_rejected?
    self.status == :approved || self.status == :rejected
  end

  def was_assigned_or_reviewed?
    self.status_was == :assigned || self.status_was == :review
  end

  def approved_status?
    self.status_was == :approved || self.status == :approved
  end

  def followup?
    self.status_was != :followup && self.status == :followup
  end

  def rejected_status?
    self.status_was == :rejected || self.status == :rejected
  end

  def reviewed?
    self.status_was != :review && self.status == :review
  end
end


##############################################################################
# Explanation:
# Before I really dug into refactoring I decided to learn how to write tests for the
# existing code. This way I can make sure that in the process of refactoring
# I don't loose desired behavior along the way.
# In order to make the test work I have added attr_accessor and learned that I need
# to alias a method that ends in a "?" because attr_accessor does not recognize it.
# Once I finished the test I looked at the code to see what it was doing.
# It's trying to see if status_was is true for assigned, review, approved, or rejected.
# Secondly it is seeing if status is true for approved, rejected, followup and review.
# I started looking at the patterns for the first two lines that if status_was true it wasn't true for status itself.
# I condensed it in one line to make more redable. Please see below for the code.
# At this point everytime I am changing things I make sure I run my tests to make sure I am on the right track
# Once everything is condensed I start creating helper methods to refactor it even more.


    # if (self.status_was == :approved || self.status == :approved) && (self.status_was == :rejected || self.status == :rejected)
    #   true
    # elsif (self.status_was == :assigned || self.status_was == :review) && (self.status == :approved || self.status == :rejected)
    #   true
    # elsif self.status_was != :followup && self.status == :followup && self.fact_checked?
    #   true
    # elsif self.status_was != :review && self.status == :review
    #   true
    # else
    #   false
    # end
