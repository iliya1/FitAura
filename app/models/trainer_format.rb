class TrainerFormat < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :training_format
end
