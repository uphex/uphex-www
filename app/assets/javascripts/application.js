var prelaunchBtns = document.getElementsByClassName('js-prelaunch-modal');
var overlay = document.getElementById('overlay');
var modal = document.getElementById('modal');
var signupContent = document.getElementById('signup-content');
var signedupContent = document.getElementById('signedup-content');
var signupEmail = document.getElementById('signup-email')
var body = document.getElementsByTagName('body')[0];

for (var i = 0; i < prelaunchBtns.length; i++) {
  prelaunchBtns[i].addEventListener('click', function(e) {
    e.preventDefault();
    toggleModal();
  }, false)
}

overlay.addEventListener('click', function(e) {
  if (overlay.id == e.target.id) {
    toggleModal();
  }
}, false)

function toggleModal() {
  body.classList.toggle('frozen');
  modal.classList.toggle('invisible');
  modal.classList.toggle('fade-in');
}

document.signup.addEventListener('submit', function(e) {
  e.preventDefault();
  signupContent.classList.toggle('hidden');
  signedupContent.classList.toggle('hidden');

  // Info to send to Customer.io
  _cio.identify({
    // Required attributes
    id: signupEmail.value,          // Unique id for the currently signed in user in your application.
    email: signupEmail.value,       // Email of the currently signed in user.
    created_at: new Date() / 1000,  // Timestamp in your system that represents when
                                    // the user first signed up. You'll want to send it
                                    // as seconds since the epoch.
  });
})
