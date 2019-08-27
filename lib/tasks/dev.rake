namespace(:dev) do
  desc "Fill the database tables with some dummy data"
    task({ :prime => :environment }) do
      require 'faker'
    # Write some Ruby to quickly create some records in your tables.
    # If it's helpful, you can use methods from the Faker gem for random data:
    #   https://github.com/stympy/faker
      10.times do
        
      end
  end
end
