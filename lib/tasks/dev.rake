namespace(:dev) do
  desc "Fill the database tables with some dummy data"
    task({ :prime => :environment }) do
      require 'faker'
    # Write some Ruby to quickly create some records in your tables.
    # If it's helpful, you can use methods from the Faker gem for random data:
    #   https://github.com/stympy/faker
      10.times do
        u = User.new
        u.name = Faker::Name.name
        u.email = Faker::Internet.email
        u.location = Faker::Address.city
        u.save
      end

      20.times do
        p = Proposal.new
        p.name = Faker::Hipster.sentence(word_count: 4)
        p.description = Faker::Hipster.paragraphs(number: 2)
        p.location = Faker::Address.city
        p.status = ['draft','published','project','archived'].sample
        p.owned_by_user_id = User.all.pluck(:id).sample
        p.save
      end
  end
end
