# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user seed
users = [
       {:username => 'jiajia', :password => 'jiajia', :password_confirmation => 'jiajia', :current_password=>'jiajia',
       :email => '111@gmail.com', :first_name => 'Jiajia', :last_name => 'Hou', :function => 'donor management, dashboard, report management, user management',
       :phone_number => '12345678', :street_address => 'sesame street', :zipcode => 77840      
       },
       {:username => 'user2', :password => 'user2', :password_confirmation => 'user2', :current_password=>'user2',
       :email => '222@gmail.com', :first_name => 'James', :last_name => 'Bond', :function => 'donor management, dashboard, report management',
       :phone_number => '12345679', :street_address => 'sesame street', :zipcode => 77841      
       },
       {:username => 'user3', :password => 'user3', :password_confirmation => 'user3', :current_password=>'user3',
       :email => '333@gmail.com', :first_name => 'Emily', :last_name => 'Jones', :function => 'donor management',
       :phone_number => '12345680', :street_address => 'sesame street', :zipcode => 77842      
       }
       ]
       
users.each do |user|
  User.create!(user)
end

# access email seed
accesses = [{:email => 'tonywang@tamu.edu'},
          {:email => 'lihao@tamu.edu'}]

accesses.each do |access|
  Access.create!(access)
end

#donor seed
donors = [
            {:flag => 'I', :title => 'Mr.', :first_name => 'Albert', :last_name => 'Linkoln', :company => 'Apple', :organization => 'PTSD'},
            {:flag => 'O', :title => 'Mrs.', :first_name => 'Sophia', :last_name => 'Elizabeth', :company => 'Google', :organization => 'Google Charity'},
            {:flag => 'I', :title => 'Mr.', :first_name => 'Albert', :last_name => 'Zhang', :company => 'Linkedin', :organization => 'ABCD'},
            {:flag => 'O', :title => 'Mr.', :first_name => 'Sam', :last_name => 'Smith', :company => 'Apple', :organization => 'PTSD'},
            {:flag => 'I', :title => 'Mr.', :first_name => 'Johnny', :last_name => 'Walker',:company => 'Federal Government', :organization => 'ABba'},
            {:flag => 'I', :title => 'Mrs.', :first_name => 'Michelle',:last_name => 'Glanger',:company => 'NASA', :organization => 'abBa'}
          ]
  

contacts = [
          {:contact_date => '2016-04-01', :followup_date => '2016-05-22', :donor_id => '1', :narrative => 'Discussion about event in May'},
          {:contact_date => '2016-04-02', :followup_date => '2016-05-23', :donor_id => '2', :narrative => 'Funding raising for April'},
          {:contact_date => '2016-03-31', :followup_date => '2016-05-21', :donor_id => '1', :narrative => 'Discussion about next donation from Golden Lion'},
          {:contact_date => '2016-03-31', :followup_date => '2016-05-26', :donor_id => '3', :narrative => 'Financial Report to Silver Fox'},
          ]
          
          
reports = [  
            {
             :title => '2014 donation by amount',
             :description => 'amount between 0 to 500, the whole 2014',
             :last_run => '2016-04-01',
             :created_by => 'jojo',
             :created_at => '2015-01-24',
             :last_modified_by => 'ste',
             :last_modified_at => '2016-02-18'
            }
        ]
          
          
filters =[
			{
				:table_name => 'finance',
				:field_name => 'date',
				:value =>'',
				:min_value =>'',
				:max_value =>'',
				:min_date =>'2014-01-01',
				:max_date =>'2014-12-31',
				:created_by =>'',
				:created_at =>'',
				:last_modified_at =>'',
				:last_modified_by =>'',
				:report_id => 1
			},
					
			{
				:table_name => 'finance',
				:field_name => 'amount',
				:value =>'',
				:min_value =>'0',
				:max_value =>'1000',
				:min_date =>'',
				:max_date =>'',
				:created_by =>'',
				:created_at =>'',
				:last_modified_at =>'',
				:last_modified_by =>'',
				:report_id => 1
			},
					
			{
				:table_name => 'donor',
				:field_name => 'first_name',
				:value =>'ds',
				:min_value =>'',
				:max_value =>'',
				:min_date =>'',
				:max_date =>'',
				:created_by =>'',
				:created_at =>'',
				:last_modified_at =>'',
				:last_modified_by =>'',
				:report_id => 1
			},
	
			{
				:table_name => 'donor',
				:field_name => 'last_name',
				:value =>'bsa',
				:min_value =>'',
				:max_value =>'',
				:min_date =>'',
				:max_date =>'',
				:created_by =>'',
				:created_at =>'',
				:last_modified_at =>'',
				:last_modified_by =>'',
				:report_id => 1
			}
]          
reports.each do |report|
  Report.create!(report)
end

filters.each do |filter|
  Filter.create!(filter)
end

donors.each do |donor|
  Donor.create!(donor)
end


contacts.each do |contact|
  Contact.create!(contact)
end
