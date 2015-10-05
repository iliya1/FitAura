class ScheduleService
  def initialize(resource, start_date, end_date)
    @resource = resource
    @start_date = start_date.to_date
    @end_date = end_date.to_date
    @available_timeslots = @resource.timeslots.to_a
  end

  def slots
    result = []
    @start_date.upto( @end_date ) do |d|
      result << {day: d, timeslots: timeslots_for_day(d)} if timeslots_for_day(d).size > 0
    end
    result
  end

  def upcoming?
    slots.size > 0
  end

  def timeslots_for_day(d)
    @available_timeslots.select{|ts| ts.start_date.to_date <= d && ts.end_date >= d && ts.days.include?( d.strftime("%A") ) }
  end
end
