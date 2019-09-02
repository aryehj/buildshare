namespace(:dev) do
  desc "Fill the database tables with some dummy data"
    task({ :prime => :environment }) do
      require 'faker'

      200.times do
        u = User.new
        u.name = Faker::Name.name
        u.email = Faker::Internet.email
        u.city = Faker::Address.city
        u.state = Faker::Address.state_abbr
        u.zipcode = Faker::Address.zip.to_s.first(5).to_i
        u.password = "poop"
        u.save
      end

      20.times do
        p = Proposal.new
        p.name = Faker::Hipster.sentence(word_count: 4)
        p.description = Faker::Hipster.paragraph
        p.status = ['draft','published','project','archived'].sample
        p.owned_by_user_id = User.all.pluck(:id).sample
        owner = User.where(:id => p.owned_by_user_id).first
        p.city = owner.city
        p.state = owner.state
        p.zipcode = owner.zipcode
        p.save
      end

      50.times do
      	c = Comment.new
      	c.comment = Faker::Hipster.sentence
      	c.user_id = User.all.pluck(:id).sample
      	c.proposal_id = Proposal.where.not(:status => "draft").pluck(:id).sample
      	c.save
      end

      100.times do
      	v = Vote.new
      	v.user_id = User.all.pluck(:id).sample
      	v.proposal_id = Proposal.where.not(:status => "draft").pluck(:id).sample
      	v.save
      end

      80.times do
      	s = Step.new
      	s.proposal_id = Proposal.all.pluck(:id).sample
      	s.name = Faker::Hipster.sentence(word_count: 3)
        p = Proposal.where(:id => s.proposal_id).first
        if p.status == "draft"
          s.status = "unassigned"
        else
      	  s.status = ["unassigned","assigned","done"].sample
        end
        if s.status == "assigned" || s.status == "done"
          s.volunteer_user_id = User.all.pluck(:id).sample
        end
      	s.save
      end

      # 40.times do
      #	 s = Stakeholder.new
      #	 s.name = Faker::Name.name
      #	 s.email = Faker::Internet.email
      #	 s.phone = Faker::PhoneNumber.phone_number
      #	 s.address = Faker::Address.full_address
      #	 s.proposal_id = Step.all.pluck(:proposal_id).sample
      #	 s.step_id = Step.where(:proposal_id => s.proposal_id).pluck(:id).sample
      #	 s.created_by_user_id = User.all.pluck(:id).sample
      #	 s.save
      # end

  end
end
