cat = ["Trending","Entertainment","Business","Technology","International","Share Market","Matrimonials","Horoscope","Health"]


cat.each do |c|
    4.times do |i|
        Article.create(category:c,title: "title#{c+i.to_s}",author:"author#{i}",body:"Lorem ipsum dolor sit, amet compositis cumanum defuturum, exquisitis inveniri migrare opes tum videretur. Alienae consule imperii ineruditus, ob prodesset provocarem referta venandi. Accommodare bono corrupti cura geometria horrent opinionum philosophis placebit privamur probo tua. Abest aliud contineri displicet, inportuno inveniri")
    end
end

#rails db:seed
#Run the above command to seed the data into your database


