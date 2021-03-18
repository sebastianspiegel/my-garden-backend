# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
    :seed_keys => ["common_name", "latin_name", "img", "info"],
    :seeds => [
        ["Victoria Falls", "Trailing Asarina", "https://www.swallowtailgardenseeds.com/flowers/asarinas/asarina-victoria-falls.jpg", "Start indoors 10-12 weeks before the last frost. Sow in cell packs or flats, press into soil but do not cover. Needs light to germinate. Kept at 70-75°F., germination is in 14-21 days. When seedlings have several sets of true leaves, transplant into individual containers."],
        ["Rainbow Treasure", "Fragaria x ananassa", "https://www.swallowtailgardenseeds.com/gardens/vegetables/strawberry-rainbow%20treasure.jpg", "Sow seed in cell packs or flats, press into soil but do not cover. Needs light to germinate. Kept at 60-65°F., germination averages 21-30 days. Transplant into the garden, 12 in. apart."],
        ["Peppermint", "Mentha piperita", "https://www.swallowtailgardenseeds.com/gardens/herbs/peppermint.jpg","Sow seeds in cell packs or flats, press into soil but do not cover. Needs light to germinate. Kept at 65-75° F., seedlings emerge in 7-21 days. Transplant peppermint plants into containers or into garden 1-2 ft. apart."],
        ["Sen­sitive Plant", "Mimosa pudica", "https://www.swallowtailgardenseeds.com/flowers/mimosa/mimosa-sensitive-plant.jpeg", "Soak Mimosa seed in hand hot water, 20 minutes prior to sowing seeds in cell packs or flats. Press into soil, but do not cover. Kept at 75° F., germination is in 21-40 days. Transfer Mimosa seedlings into 3 in. pots once large enough to handle."],
        ["Super Enorma", "English Daisy", "https://www.swallowtailgardenseeds.com/flowers/bellis/english-daisy-super-enorma.jpeg", "Sow seed in cell packs or flats, press into soil and barely cover. Light will aid germination. Kept at 70°F., germination is in 7-21 days. Transplant into the garden 6 in. apart."],
        ["Mad Hatter", "Hot Pepper", "https://www.swallowtailgardenseeds.com/gardens/vegetables/pepper-mad-hatter.jpg", "Sow hot pepper seeds indoors in cell packs or flats, 8 weeks before the last anticipated frost. At 70-90°F., germination is in 8-25 days. When the soil has warmed to at least 60°F., transplant into the garden 18-24 in. apart."]
    ]
}

def make_seeds
    DATA[:seeds].each do |seed|
        new_seed = Seed.new
        seed.each_with_index do |attribute, i|
            new_seed.send(DATA[:seed_keys][i]+"=", attribute)
        end
        new_seed.save
    end
end

def make_gardens
    g = Garden.new(name: "default")
    g.user = User.first
    g.save 
end

def make_test_user
    User.create(username: "Gesh")
end

make_seeds 
make_test_user
make_gardens 