class UserSerializer
    include FastJsonapi::ObjectSerializer

    attributes :username, :id

    has_many :gardens 

end
