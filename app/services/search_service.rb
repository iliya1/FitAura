class SearchService

  def self.classes(zip, query)
    studios = Studio.where(zipcode: zip)
    trainers = Trainer.where(zipcode: zip)

    if query
      query = "%#{query}%"
      StudioClass.where("studio_id in (?) AND ( name ilike ? OR description ilike ?)", studios.collect(&:id), query, query ) + 
        TrainerClass.where("trainer_id in (?) AND ( name ilike ? OR description ilike ?)", trainers.collect(&:id), query, query )
    else
      StudioClass.where("studio_id in (?)", studios.collect(&:id) ) + TrainerClass.where("trainer_id in (?)", trainers.collect(&:id) )
    end
  end

end
