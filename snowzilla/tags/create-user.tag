<create-user>
	<div class="col-md-6">
        <div>
            <h1>Create</h1>
        </div>
        <!--Creating the text input section-->
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-md-2 control-label" for="playerName">First Name</label>
                	<div class="col-md-9">
                		<input id="firstName" type="text" class="form-control" placeholder="e.g. Mario">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="playerName">Last Name</label>
                    <div class="col-md-9">
                        <input id="lastName" type="text" class="form-control" placeholder="e.g. the Plumber">
                    </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="playerName">Date of Birth</label>
                    <div class="col-md-9">
                        <input id="dob" type="date" class="form-control">
                    </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="playerName">School</label>
                    <div class="col-md-9">
                        <input id="school" type="text" class="form-control" placeholder="e.g. PS 180: Hugo Newman">
                    </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="playerName">Email</label>
                    <div class="col-md-9">
                        <input id="email" type="email" class="form-control" placeholder="mario@gmail.com">
                    </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="playerName">Username</label>
                    <div class="col-md-9">
                        <input id="createUsername" type="text" class="form-control" placeholder="input username">
                    </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="playerName">Password</label>
                    <div class="col-md-9">
                        <input id="createPassword" type="password" class="form-control" placeholder="input password">
                    </div>
            </div>
        
            <div class="form-group">
                <div class="col-md-10 col-md-offset-2">
                    <button id="saveUser" class="btn btn-success" type="button" onclick={ saveUser }>Save</button>
                </div>
            </div>
    	</form>
	</div>

<script>

//Declaring the user class of Parse objects
var User = Parse.Object.extend("User");

//Event Listener for save button
// $('#saveUser').click(saveUser);

//Function to save User
this.saveUser = function(event) {
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
</script>


<style type="text/css">
	
</style>

</create-user>
