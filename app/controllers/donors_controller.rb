class DonorsController < ApplicationController

    before_action :check_authorization
    

    def index
        @donor_attr = Donor.attribute_names
        @donor_attr_show = ["flag", "title", "first_name", "last_name", "organization", "company"]
        @donors = Donor.search_by(params[:donor]).where('active = 1')
    end
    
    def new 
        @donor = Donor.new
        @donor_contact = [
	        "contact_date",
	        "followup_date",
	        "narrative"
	    ]
	    @donor_finance = [
            '_type',
            'date',
            'amount',
            'description', 
            'designation'
        ]
        #render(:partial => 'donor_info', :object => @donor) if request.xhr?
    end
    
    def destroy
        id = params[:id]
        @donor = Donor.find(id)
        flash[:notice] = "#{@donor.first_name} #{@donor.last_name} is deleted."
        @donor.update_attributes(:active => 0)
        redirect_to donors_path
    end
    
    def create
        params[:donor][:active] = 1
        @donor = Donor.create!(params[:donor])
        flash[:notice] = "#{@donor.first_name} #{@donor.last_name} was successfully created."
        if params[:where] == "inplace"
            render :json => @donor
        else
            render :json => {:id => @donor.id}
        end
    end

    def show
        id = params[:id]
        @active = params[:active]
        @donor = Donor.find(id)
        @donor_basic = {
            'Title' => @donor.title,
            'First Name' => @donor.first_name,
            'Last Name' => @donor.last_name,
            'Middle Name' => @donor.middle_name,
            'Salution' => @donor.salution,
            'Email' => @donor.email,
  	        'Organization' => @donor.organization,
  	        'Company' => @donor.company,
  	        'Street Address' => @donor.street_address,
  	        'City' => @donor.city,
  	        'State' => @donor.state,
  	        'Countrt' => @donor.country,
  	        'Zip Code' => @donor.zipcode,
            'Home Phone' => @donor.home_phone,
            'Business Phone' => @donor.business_phone
	        }
	    @donor_contact = [
	        "contact_date",
	        "followup_date",
	        "narrative"
	    ]
	    @contacts = Contact.where(:donor_id => @donor.id)
	    @finances = Finance.where(:donor => @donor.id)
	    @donor_finance = [
            '_type',
            'date',
            'amount',
            'description', 
            'designation'
        ]
    end
    
    def update
      @donor = Donor.find(params[:id])
      @donor.update_attributes(params[:donor])
      
      if @donor.flag == "I"
        type = "Individual"
      elsif @donor.flag == "O"
        type = "Organization"
      end
      
      render :json => @donor if request.xhr? && params[:where] == "inplace"
      
      @donor_basic = {
            'Title' => @donor.title,
            'First Name' => @donor.first_name,
            'Last Name' => @donor.last_name,
            'Middle Name' => @donor.middle_name,
            'Salution' => @donor.salution,
            'Email' => @donor.email,
  	        'Organization' => @donor.organization,
  	        'Company' => @donor.company,
  	        'Street Address' => @donor.street_address,
  	        'City' => @donor.city,
  	        'State' => @donor.state,
  	        'Countrt' => @donor.country,
  	        'Zip Code' => @donor.zipcode,
            'Home Phone' => @donor.home_phone,
            'Business Phone' => @donor.business_phone
	        }
      render(:partial => 'donor_summary', :object => @donor_basic) if request.xhr? && !params[:where]
    end
    
    def showByContact
      contact_id = params[:contactId]
      @contact = Contact.find(contact_id)
      @donor = @contact.donor
      redirect_to controller:'donors', action:'show', id:@donor.id, active:2
    end
    
    def showSummary
      id = params[:id]
      @donor = Donor.find(id)
      
      if @donor.flag == "I"
        type = "Individual"
      elsif @donor.flag == "O"
        type = "Organization"
      end
      
      @donor_basic = {
          'Type' => type,
          'Title' => @donor.title,
          'First Name' => @donor.first_name,
          'Last Name' => @donor.last_name,
          'Middle Name' => @donor.middle_name,
          'Salution' => @donor.salution,
          'Email' => @donor.email,
  	      'Organization' => @donor.organization,
  	      'Company' => @donor.company,
  	      'Street Address' => @donor.street_address,
  	      'City' => @donor.city,
  	      'State' => @donor.state,
  	      'Countrt' => @donor.country,
  	      'Zip Code' => @donor.zipcode,
          'Home Phone' => @donor.home_phone,
          'Business Phone' => @donor.business_phone
	     }
	     render(:partial => 'donor_summary', :object => @donor_basic) if request.xhr?
    end
    
    def check_authorization
        unless current_user.function and current_user.function.include? 'donor management'
            flash[:notice]="Sorry, authorization check failed!"
            redirect_to homepage_path
        end
    end
end
