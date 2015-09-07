class StudioClass < ActiveRecord::Base
  belongs_to :studio


  def to_param
    "#{id}-#{name.parameterize}"
  end

end
