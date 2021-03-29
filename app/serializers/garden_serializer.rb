class GardenSerializer
    include FastJsonapi::ObjectSerializer

    attributes :name, :user_id, :id 

    belongs_to :user 

end
