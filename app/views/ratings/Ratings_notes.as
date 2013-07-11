  11:35 AM
Frame number: 0/3
[1] pry(main)> Hate.count
   (2.5ms)  SELECT COUNT(*) FROM "hates"
=> 4

[2] pry(main)> Hate.last
  Hate Load (4.3ms)  SELECT "hates".* FROM "hates" ORDER BY "hates"."id" DESC LIMIT 1
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[3] pry(main)> h = Hate.last
  Hate Load (0.9ms)  SELECT "hates".* FROM "hates" ORDER BY "hates"."id" DESC LIMIT 1
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[4] pry(main)> h
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[5] pry(main)> h.ratings
  Rating Load (2.4ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4
=> []

[6] pry(main)> Rating
=> Rating(id: integer, hate_id: integer, user_id: integer, hate_up: integer, hate_down: integer, created_at: datetime, updated_at: datetime)

[7] pry(main)> r = Rating.new
=> #<Rating id: nil, hate_id: nil, user_id: nil, hate_up: nil, hate_down: nil, created_at: nil, updated_at: nil>

[8] pry(main)> r.hate_up
=> nil

[9] pry(main)> r.hate_up.class
=> NilClass

[10] pry(main)> r.hate_up = 1
=> 1

[11] pry(main)> r
=> #<Rating id: nil, hate_id: nil, user_id: nil, hate_up: 1, hate_down: nil, created_at: nil, updated_at: nil>

[12] pry(main)> r.hate_down = 1
=> 1

[13] pry(main)> r
=> #<Rating id: nil, hate_id: nil, user_id: nil, hate_up: 1, hate_down: 1, created_at: nil, updated_at: nil>

[14] pry(main)> r.hate_down = 0
=> 0

[15] pry(main)> Hate
=> Hate(id: integer, category: string, post: text, hate_rate: integer, created_at: datetime, updated_at: datetime)

[16] pry(main)> r
=> #<Rating id: nil, hate_id: nil, user_id: nil, hate_up: 1, hate_down: 0, created_at: nil, updated_at: nil>

[17] pry(main)>

[18] pry(main)> h
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[19] pry(main)> h
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[20] pry(main)> h.ratings << r
   (0.4ms)  BEGIN
  SQL (90.1ms)  INSERT INTO "ratings" ("created_at", "hate_down", "hate_id", "hate_up", "updated_at", "user_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", Wed, 10 Jul 2013 23:20:36 UTC +00:00], ["hate_down", 0], ["hate_id", 4], ["hate_up", 1], ["updated_at", Wed, 10 Jul 2013 23:20:36 UTC +00:00], ["user_id", nil]]
   (4.4ms)  COMMIT
=> [#<Rating id: 1, hate_id: 4, user_id: nil, hate_up: 1, hate_down: 0, created_at: "2013-07-10 23:20:36", updated_at: "2013-07-10 23:20:36">]

[21] pry(main)> h.ratings
=> [#<Rating id: 1, hate_id: 4, user_id: nil, hate_up: 1, hate_down: 0, created_at: "2013-07-10 23:20:36", updated_at: "2013-07-10 23:20:36">]

[22] pry(main)> h.ratings.count
   (1.0ms)  SELECT COUNT(*) FROM "ratings" WHERE "ratings"."hate_id" = 4
=> 1

[23] pry(main)> h.ratings.where(:hate_up => 1)
  Rating Load (0.8ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4 AND "ratings"."hate_up" = 1
=> [#<Rating id: 1, hate_id: 4, user_id: nil, hate_up: 1, hate_down: 0, created_at: "2013-07-10 23:20:36", updated_at: "2013-07-10 23:20:36">]

[24] pry(main)> h.ratings.where(:hate_down => 1)
  Rating Load (0.8ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4 AND "ratings"."hate_down" = 1
=> []

[25] pry(main)> h.ratings.new(:hate_down => 1)
=> #<Rating id: nil, hate_id: 4, user_id: nil, hate_up: nil, hate_down: 1, created_at: nil, updated_at: nil>

[26] pry(main)> h.save
   (0.4ms)  BEGIN
  SQL (1.0ms)  INSERT INTO "ratings" ("created_at", "hate_down", "hate_id", "hate_up", "updated_at", "user_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", Wed, 10 Jul 2013 23:24:20 UTC +00:00], ["hate_down", 1], ["hate_id", 4], ["hate_up", nil], ["updated_at", Wed, 10 Jul 2013 23:24:20 UTC +00:00], ["user_id", nil]]
   (3.6ms)  COMMIT
=> true

[27] pry(main)> h
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[28] pry(main)> h.ratings.count
   (0.8ms)  SELECT COUNT(*) FROM "ratings" WHERE "ratings"."hate_id" = 4
=> 2

[29] pry(main)> h.ratings.where(:hate_down => 1)
  Rating Load (0.8ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4 AND "ratings"."hate_down" = 1
=> [#<Rating id: 2, hate_id: 4, user_id: nil, hate_up: nil, hate_down: 1, created_at: "2013-07-10 23:24:20", updated_at: "2013-07-10 23:24:20">]

[30] pry(main)> h.ratings.where(:hate_down => 1).count
   (0.8ms)  SELECT COUNT(*) FROM "ratings" WHERE "ratings"."hate_id" = 4 AND "ratings"."hate_down" = 1
=> 1

[31] pry(main)> h.ratings.where(:hate_up => 1).count
   (0.8ms)  SELECT COUNT(*) FROM "ratings" WHERE "ratings"."hate_id" = 4 AND "ratings"."hate_up" = 1
=> 1

[32] pry(main)> reload!
Reloading...
=> true

[33] pry(main)> h
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[34] pry(main)> h.reload
  Hate Load (1.0ms)  SELECT "hates".* FROM "hates" WHERE "hates"."id" = $1 LIMIT 1  [["id", 4]]
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[35] pry(main)> h
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[36] pry(main)> h.ratings
  Rating Load (0.5ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4
=> [#<Rating id: 1, hate_id: 4, user_id: nil, hate_up: 1, hate_down: 0, created_at: "2013-07-10 23:20:36", updated_at: "2013-07-10 23:20:36">,
 #<Rating id: 2, hate_id: 4, user_id: nil, hate_up: nil, hate_down: 1, created_at: "2013-07-10 23:24:20", updated_at: "2013-07-10 23:24:20">]

[37] pry(main)> h.ratings.up_count
  Rating Load (0.8ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4
NoMethodError: undefined method `up_count' for #<ActiveRecord::Relation:0x007ffcc4a22ce0>
from /Users/mikejarrell/.rvm/gems/ruby-2.0.0-p195/gems/activerecord-3.2.13/lib/active_record/relation/delegation.rb:45:in `method_missing'

[38] pry(main)> reload!
Reloading...
=> true

[39] pry(main)> h.reload
  Hate Load (0.6ms)  SELECT "hates".* FROM "hates" WHERE "hates"."id" = $1 LIMIT 1  [["id", 4]]
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[40] pry(main)> h
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[41] pry(main)> h.ratings
  Rating Load (0.5ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4
=> [#<Rating id: 1, hate_id: 4, user_id: nil, hate_up: 1, hate_down: 0, created_at: "2013-07-10 23:20:36", updated_at: "2013-07-10 23:20:36">,
 #<Rating id: 2, hate_id: 4, user_id: nil, hate_up: nil, hate_down: 1, created_at: "2013-07-10 23:24:20", updated_at: "2013-07-10 23:24:20">]

[42] pry(main)> h.ratings.up_count
  Rating Load (0.8ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4
NoMethodError: undefined method `up_count' for #<ActiveRecord::Relation:0x007ffcc4a87780>
from /Users/mikejarrell/.rvm/gems/ruby-2.0.0-p195/gems/activerecord-3.2.13/lib/active_record/relation/delegation.rb:45:in `method_missing'

[43] pry(main)> Rating
=> Rating(id: integer, hate_id: integer, user_id: integer, hate_up: integer, hate_down: integer, created_at: datetime, updated_at: datetime)

[44] pry(main)> Rating.up_count
   (0.8ms)  SELECT COUNT(*) FROM "ratings" WHERE "ratings"."hate_up" = 1
=> 1

[45] pry(main)> h = Hate.last
  Hate Load (0.7ms)  SELECT "hates".* FROM "hates" ORDER BY "hates"."id" DESC LIMIT 1
=> #<Hate id: 4, category: "The morning after", post: "awkqard", hate_rate: 4, created_at: "2013-07-10 23:05:03", updated_at: "2013-07-10 23:05:03">

[46] pry(main)> h.ratings
  Rating Load (0.8ms)  SELECT "ratings".* FROM "ratings" WHERE "ratings"."hate_id" = 4
=> [#<Rating id: 1, hate_id: 4, user_id: nil, hate_up: 1, hate_down: 0, created_at: "2013-07-10 23:20:36", updated_at: "2013-07-10 23:20:36">,
 #<Rating id: 2, hate_id: 4, user_id: nil, hate_up: nil, hate_down: 1, created_at: "2013-07-10 23:24:20", updated_at: "2013-07-10 23:24:20">]

[47] pry(main)> h.ratings.up_count
   (0.8ms)  SELECT COUNT(*) FROM "ratings" WHERE "ratings"."hate_id" = 4 AND "ratings"."hate_up" = 1
=> 1