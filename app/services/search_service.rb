class SearchService

  def self.classes(zip, query)
    studios = Studio.where(zipcode: zip).includes(:studio_classes)
    trainers = Trainer.where(zipcode: zip).includes(:trainer_classes)

    if query
    else
      ( studios.collect(&:studio_classes) + trainers.collect(&:trainer_classes) ).flatten
    end
  end

end
