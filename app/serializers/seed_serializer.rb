class SeedSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :common_name, :latin_name, :img, :info

end
