// Initializing Parse
Parse.initialize("q8VG9RxVyaj9GFlhqr20IzOOx19yoiEnstZnIhDv", "Tp8M5MjTO7SPvk2ggKK0hYmrzvN4XjMoaSeCoAaz");

// RIOT MOUNT
riot.mount('create-user');
// riot.mount('login');





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