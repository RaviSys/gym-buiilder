$(document).ready(function(){ 
  $('#contact_form').validate({
    error: function(label) {
      $(this).addClass('error');
    },
    rules: {
      'contact[name]': {
        required: true,
        lettersonly: /^[a-zA-Z\s]+$/ 
      },
      'contact[email]': {
        required: true,
        email: /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i
      },
      'contact[contact_number]': {
        required: true,
        digits: true,
        minlength: '10',
        maxlength: '10'
      },
      'contact[message]': {
        required: true
      }
    },
    messages: {
      'contact[name]': {
        required: 'Please Enter your name.'
      },
      'contact[email]': {
        required: 'Please enter a email'
      },
      'contact[contact_number]': {
        required: 'Enter a 10 digit number'
      },
      'contact[message]': {
        required: 'Message can\'t be blank.'
      }
    }
  });  
  $.validator.addMethod('lettersonly', function(value, element, regexpr) {
    return regexpr.test(value);
  },'Letters and spaces only please');
  $.validator.addMethod('email', function(value, element, regexpr) {
    return regexpr.test(value);
  },'Please enter a valid email'); 
});  
