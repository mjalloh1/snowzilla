// Initializing Parse
Parse.initialize("q8VG9RxVyaj9GFlhqr20IzOOx19yoiEnstZnIhDv", "Tp8M5MjTO7SPvk2ggKK0hYmrzvN4XjMoaSeCoAaz");

riot.mount('create-user');
riot.mount('login');


//Declaring the user class of Parse objects
var User = Parse.Object.extend("User");

//Event Listener for save button
$('#saveUser').click(saveUser);

//Function to save User
function saveUser() {
    var firstName = $('#firstName').val() || undefined;
    var lastName = $('#lastName').val() || undefined;
    var dob = $('#dob').val() || undefined;
    var school = $('#school').val() || undefined;
    var email = $('#email').val() || undefined;
    var createUsername = $('#createUsername').val() || undefined;
    var createPassword = $('#createPassword').val() || undefined;

    var query = new Parse.Query('User');
    query.equalTo("username", createUsername);
    query.find().then(function(results) {
        if (createPassword) {
            var user = new User({
                firstName: firstName,
                lastName: lastName,
                dob: dob,
                school: school,
                email: email,
                username: createUsername,
                password: createPassword
            });

            user.save().then(function(user) {
                alert("New object created with objectID: " + user.id);
                resetForm();
            }, function(error) {
                alert("Failed to create new object: " + error.message);
            });

        } else {
            alert("You must enter a password.");
        }
    });
}

//Form Reset function
function resetForm() {
    $('input[type="text"]').val('');
    $('input[type="password"]').val('');
    $('input[type="date"]').val('');
    $('input[type="email"]').val('');
}

//User logs in
$('#loginButton').click(loginUser);

function loginUser() {
    var username = $('#loginUsername').val() || undefined;
    var password = $('#loginPassword').val() || undefined;

    Parse.User.logIn(username, password, {
        success: function(user) {
            //once they login successfully,put code for what to do next here    
            alert("Yeay, you logged in successfully!");
        },
        error: function(user, error) {
            // The login failed. Check error to see why.
            alert("Failed to login: " + error.message);
        }
    });
}