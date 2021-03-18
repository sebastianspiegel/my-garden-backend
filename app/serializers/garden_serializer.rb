class GardenSerializer
    include FastJsonapi::ObjectSerializer

    attributes :name, :user_id

    belongs_to :user 

end
