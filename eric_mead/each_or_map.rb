# Each & Map Exercise
#
# Below is an array of hashes, stored in a variable called `blog_posts`. Each
# blog post has various attributes stored in the hash (e.g. `:title`, `:body`,
# etc. Our goal is to iterate through all of the blog posts and return all of
# the unqiue tags, and store it in a variable called `tags`.
#
# Continue below the hash for further instructions.

blog_posts = [
  {
    title: 'What Makes A Star Starry? Is It Me?',
    body: "Notice what Tyler Nordgren does in these posters. He's an artist, an astronomer (from Cornell, Carl Sagan's department);",
    author: {
      first_name: 'Robert',
      last_name: 'Krulwich',
      twitter_handle: '@rkrulwich'
    },
    tags: ['art', 'education', 'science']
  },
  {
    title: 'The Meter: The Measure of a Man',
    body: "About six and a half billion people use the metric system every single day.  That's more than the citizens of any single nation, the followers of any single religion or the speakers of any single language.",
    author: {
      first_name: 'Latif',
      last_name: 'Nasser',
      twitter_handle: '@latifnasser'
    },
    tags: ['discovery', 'dialogues', 'history', 'meter', 'science', 'storytelling']
  },
  {
    title: 'Shattering Silence and An Eye of God',
    body: "In our Morality show, we tell the story of Eastern State Penitentiary -- a radical new kind of prison engineered to crack into the hearts and minds of 19th-Century criminals",
    author: {
      first_name: 'Brenna',
      last_name: 'Farrell',
      twitter_handle: '@brennacfarrell'
    },
    tags: ['history', 'morality', 'prison']
  }
]


tags = blog_posts.map do |tag|
  tag[:tags]
end
tags = tags.flatten.uniq

#brooks solution: tags = blog_posts.map { |post| post[:tags] }.flatten.uniq

if tags != ['art', 'education', 'science', 'discovery', 'dialogues', 'history', 'meter', 'storytelling', 'morality', 'prison']
  puts "Hmm, it looks like you don't have all of the unique tags stored in a variable called `tags`. \n I was looking for this:"
  puts '["art", "education", "science", "discovery", "dialogues", "history", "meter", "storytelling", "morality", "prison"]'
  puts 'But your tags array looks like this:'
  puts "#{tags}"
else
  puts "Congratulations! Your tags array contains all of the unique tags from the blogpost above"
end