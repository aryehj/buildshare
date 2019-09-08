namespace(:dev) do
  desc "Fill the database tables with some dummy data"
    task({ :prime => :environment }) do
      require 'faker'

      50.times do
        u = User.new
        u.name = Faker::Name.name
        u.email = Faker::Internet.email
        u.city = Faker::Address.city
        u.state = Faker::Address.state_abbr
        u.zipcode = Faker::Address.zip.to_s.first(5).to_i
        u.password = "poop"
        u.save
      end

      user_ids = User.all.pluck(:id)

      200.times do
        p = Proposal.new
        p.name = Faker::Hipster.sentence(word_count: 4)
        p.description = Faker::Hipster.paragraph
        p.status = ['draft','published','archived'].sample
        p.owner_id = user_ids.sample
        owner = p.owner
        p.city = owner.city
        p.state = owner.state
        p.zipcode = owner.zipcode
        p.save
        f = Follower.new
        f.proposal_id = p.id
        f.user_id = p.owner_id
        f.save
      end

      live_proposal_ids = Proposal.where.not(:status => "draft").pluck(:id)
      proposal_ids = Proposal.all.pluck(:id)

      400.times do
      	c = Comment.new
      	c.comment = Faker::Hipster.sentence
      	c.user_id = user_ids.sample
      	c.proposal_id = live_proposal_ids.sample
      	c.save
      end


      800.times do
      	s = Step.new
      	s.proposal_id = proposal_ids.sample
      	s.name = Faker::Marketing.buzzwords
  #      p = Proposal.where(:id => s.proposal_id).first
        p = s.proposal
        if p.status == "draft"
          s.status = "unassigned"
        else
      	  s.status = ["unassigned","assigned","done"].sample
        end
        if s.status != "unassigned"
          s.volunteer_id = user_ids.sample
        end
      	s.save
      end

      500.times do
      	f = Follower.new
      	f.proposal_id = live_proposal_ids.sample
        f.proposal = Proposal.where(:id => f.proposal_id).first
        f.user_id = User.where.not(:id => f.proposal.owner.id).pluck(:id).sample
      	f.save
      end

  end
end
