namespace(:dev) do
  desc "Fill the database tables with some dummy data"
    task({ :prime => :environment }) do
      require 'faker'

      10.times do
        u = User.new
        u.name = Faker::Name.name
        u.email = Faker::Internet.email
        u.city = Faker::Address.city
        u.state = Faker::Address.state_abbr
        u.zip = Faker::Address.zip.to_s.gsub("-","").to_i
        u.save
      end

      20.times do
        p = Proposal.new
        p.name = Faker::Hipster.sentence(word_count: 4)
        p.description = Faker::Hipster.paragraphs(number: 2)
        p.city = Faker::Address.city
        p.state = Faker::Address.state_abbr
        p.zip = Faker::Address.zip.to_s.gsub("-","").to_i
        p.status = ['draft','published','project','archived'].sample
        p.owned_by_user_id = User.all.pluck(:id).sample
        p.save
      end
      
      50.times do
      	c = Comment.new
      	c.comment = Faker::Hipster.sentences(number: 2)
      	c.user_id = User.all.pluck(:id).sample
      	c.proposal_id = Proposal.all.pluck(:id).sample
      	c.save
      end 
      
      100.times do
      	v = Vote.new
      	v.user_id = User.all.pluck(:id).sample
      	v.proposal_id = Proposal.all.pluck(:id).sample
      	v.save
      end
      
      80.times do 
      	s = Step.new
      	s.proposal_id = Proposal.all.pluck(:id).sample
      	s.name =  Faker::Hipster.sentence(word_count: 3)
      	s.status = ["unassigned","assiged","done"].sample
      	s.save
      end 
      
      30.times do
      	c = Commitment.new
      	c.proposal_id = Step.all.pluck(:proposal_id).sample
      	c.step_id = Step.where(:proposal_id => c.proposal_id).pluck(:id).sample
      	c.user_id = User.all.pluck(:id).sample
      	c.save
      end 
      
      40.times do
      	s = Stakeholder.new
      	s.name = Faker::Name.name
      	s.email = Faker::Internet.email
      	s.phone = Faker::PhoneNumber.phone_number
      	s.address = Faker::Address.full_address
      	s.proposal_id = Step.all.pluck(:proposal_id).sample
      	s.step_id = Step.where(:proposal_id => s.proposal_id).pluck(:id).sample
      	s.created_by_user_id = User.all.pluck(:id).sample
      	s.save
      end 
       
  end
end
