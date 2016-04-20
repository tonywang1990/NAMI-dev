/*global $*/

var ReportCreator = {
  
  options: {
    parentElement: '#four-box-step'
    },
  
  DonorFields: function(){
     return('<option value="title">Title</option>'
      +'<option value="first_name">First Name</option>'
      +'<option value="last_name">Last Name</option>'
      +'<option value="middle_name">Middle Name</option>'
      +'<option value="salution">Salution</option>'
      +'<option value="email">Email</option>'
      +'<option value="organization">Organization</option>'
      +'<option value="company">Company</option>'
      +'<option value="street_address">Street Address</option>'
      +'<option value="city">City</option>'
      +'<option value="state">State</option>'
      +'<option value="country">Country</option>'
      +'<option value="zipcode">Zip Code</option>'
      +'<option value="home_phone">Home Phone</option>'
      +'<option value="business_phone">Business Phone</option>'
      +'<option value="created_by">Create by (Person)</option>'
      +'<option value="last_modified_by">Last Modified by (Person)</option>'
      +'<option value="created_at">Created at (Date)</option>'
      +'<option value="last_modified_at">Last Modified at (Date)</option>');
  }, 
    
  OrginationFields: function(){
    return('<option value="name">Name</option>'
    +'<option value="street_address">Street Address</option>'
    +'<option value="city">City</option>'
    +'<option value="state">State</option>'
    +'<option value="country">Country</option>'
    +'<option value="zipcode">Zip Code</option>'
    +'<option value="fax">Fax</option>'
    +'<option value="created_by">Create by (Person)</option>'
    +'<option value="last_modified_by">Last Modified by (Person)</option>'
    +'<option value="created_at">Created at (Date)</option>'
    +'<option value="last_modified_at">Last Modified at (Date)</option>');
  },

  ContactFields: function(){
    return('<option value="contact_date">Contact Date</option>'
           +'<option value="followup_date">Followup Date</option>'
           +'<option value="narrative">Narrative</option>'
           +'<option value="donor">Donor</option>'
           +'<option value="contact_person">Contact Person</option>'
           +'<option value="created_by">Create by (Person)</option>'
           +'<option value="last_modified_by">Last Modified by (Person)</option>'
           +'<option value="created_at">Created at (Date)</option>'
           +'<option value="last_modified_at">Last Modified at (Date)</option>');
      },
      
  FinanceFields: function(){
    return('<option value="type">Type</option>'
        +'<option value="date">Date</option>'
        +'<option value="amount">Amount</option>'
        +'<option value="description">Description</option>'
        +'<option value="donor">Donor</option>'
        +'<option value="organization">Orgination</option>'
        +'<option value="contact">Contact</option>'
        +'<option value="designation">Designation</option>'
        +'<option value="created_by">Create by (Person)</option>'
        +'<option value="last_modified_by">Last Modified by (Person)</option>'
        +'<option value="created_at">Created at (Date)</option>'
        +'<option value="last_modified_at">Last Modified at (Date)</option>');
  },
  
  ContactPersonFields: function(){
    return('<option value="title">Title</option>'
        +'<option value="first_name">First Name</option>'
        +'<option value="last_name">Last Name</option>'
        +'<option value="middle_name">Middle Name</option>'
        +'<option value="salution">Salution</option>'
        +'<option value="email">Email</option>'
        +'<option value="company">Company</option>'
        +'<option value="street_address">Street Address</option>'
        +'<option value="city">City</option>'
        +'<option value="state">State</option>'
        +'<option value="country">Country</option>'
        +'<option value="zipcode">Zip Code</option>'
        +'<option value="home_phone">Home Phone</option>'
        +'<option value="business_phone">Business Phone</option>'
        +'<option value="mobile_phone">Mobile Phone</option>'
        +'<option value="organization">Organization</option>'
        +'<option value="created_by">Create by (Person)</option>'
        +'<option value="last_modified_by">Last Modified by (Person)</option>'
        +'<option value="created_at">Created at (Date)</option>'
        +'<option value="last_modified_at">Last Modified at (Date)</option>');
  },
  
  fields_extract: function() {
    switch (this.value) {
      case '1':
        this.style.color = 'red';
        document.getElementById("availablefields").innerHTML = ReportCreator.DonorFields();
        
        break;
        
      case '2':
        this.style.color = 'blue';
        document.getElementById("availablefields").innerHTML = ReportCreator.OrginationFields();
        break;
      
      case '3':
        this.style.color = "#00ff00";
        document.getElementById("availablefields").innerHTML = ReportCreator.ContactFields();
        break;
        
      case '4':
        this.style.color = '#660066';
        document.getElementById("availablefields").innerHTML = ReportCreator.FinanceFields();
        break;
      
      case '5':
        this.style.color = '#ffcc00';
        document.getElementById("availablefields").innerHTML = ReportCreator.ContactPersonFields();
        break;
        
      default:
        return false;
    }
    $('.atr').prop('disabled', false);
  },
  
  addListeners: function() {
    
      if ($('.unselected').find('option:selected').length != 0) {
            $('.str').prop('disabled', false);
        };
        
      var unselected = $('#availablefields');
      var selected = $('#selectedfields');
      
      $('#four-box-step').find('button').bind('click', function() {
          switch ($(this).data('type')) {
              case 'str': /* Selected to the right. */
                  unselected.find('option:selected').clone().appendTo(selected);
                  $(this).prop('disabled', true);
                  break;
              case 'atr': /* All to the right. */
                  unselected.find('option').each(function () {
                      if ($(this).isVisible()) {
                          $(this).appendTo(selected);
                      }
                  });
                  break;
              case 'stl': /* Selected to the left. */
                  selected.find('option:selected').appendTo(unselected);
                  $(this).prop('disabled', true);
                  break;
              case 'atl': /* All to the left. */
                  selected.find('option').each(function () {
                          if ($(this).isVisible()) {
                              $(this).remove().appendTo(unselected);
                          }
                      });
                  break;
              default: break;
          }

//            unselected.filterByText($(ReportCreator.options.parentElement + ' .filter-unselected'), ReportCreator.options.timeout, ReportCreator.options.parentElement).scrollTop(0).sortOptions();
//            selected.filterByText($(ReportCreator.options.parentElement + ' .filter-selected'), ReportCreator.options.timeout, ReportCreator.options.parentElement).scrollTop(0).sortOptions();

          ReportCreator.handleMovement(ReportCreator.options);
          ReportCreator.toggleButtons(ReportCreator.options.parentElement);
          
      });
        
        

//        $(ReportCreator.options.parentElement).closest('form').submit(function() {
//            selected.find('option').prop('selected', true);
//        });

//        $(ReportCreator.options.parentElement).find('input[type="text"]').keypress(function(e) {
//            if (e.which === 13) {
//                event.preventDefault();
//           }
//        });

//        selected.filterByText($(options.parentElement + ' .filter-selected'), options.timeout, options.parentElement).scrollTop(0).sortOptions();
//        unselected.filterByText($(options.parentElement + ' .filter-unselected'), options.timeout, options.parentElement).scrollTop(0).sortOptions();
   
    },
    
  handleMovement: function(options){
        $(options.parentElement + ' .unselected').find('option:selected').prop('selected', false);
        $(options.parentElement + ' .selected').find('option:selected').prop('selected', false);

//        $(options.parentElement + ' .filter').val('');
        $(options.parentElement + '.fields').find('option').each(function() { $(this).show(); });

//        countElements(options.parentElement);
    },
    
  toggleButtons: function(parentElement){
        $(parentElement + ' .unselected').change(function() {
            $(parentElement + ' .str').prop('disabled', false);
        });

        $(parentElement + ' .selected').change(function() {
            $(parentElement + ' .stl').prop('disabled', false);
        });

        if ($(parentElement + ' .unselected').find('option').length == 0) {
            $(parentElement + ' .atr').prop('disabled', true);
            $(parentElement + ' .str').prop('disabled', true);
        } else {
            $(parentElement + ' .atr').prop('disabled', false);
        }

        if ($(parentElement + ' .selected').find('option').length == 0) {
            $(parentElement + ' .atl').prop('disabled', true);
            $(parentElement + ' .stl').prop('disabled', true);
        } else {
            $(parentElement + ' .atl').prop('disabled', false);
        }
    },
 
  setup: function() {
   
      $('#tables').change(ReportCreator.fields_extract);
        
      $('.fields').change(ReportCreator.addListeners);
    
  }
};


$.fn.isVisible = function() {
        return !($(this).css('visibility') == 'hidden' || $(this).css('display') == 'none');
  };
//$(ReportCreator.setup);