class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def created_at_formatted
    self.created_at.strftime("%B %d, %Y")
  end

end
