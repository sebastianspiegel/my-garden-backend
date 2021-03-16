class SeedSerializer
    include FastJsonapi::ObjectSerializer

    attributes :common_name, :latin_name, :img, :info

end
