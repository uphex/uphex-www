var prelaunchBtns = document.getElementsByClassName('js-prelaunch-modal');
var overlay = document.getElementById('overlay');
var modal = document.getElementById('modal');
var signupContent = document.getElementById('signup-content');
var signedupContent = document.getElementById('signedup-content');
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

function isEmail(string) {
  var matcher = /.+\@.+\..+/;
  return matcher.test(string);
}

function coIdentify(email) {
  _cio.identify({
    // Required attributes
    id: email,                                // Unique id for the currently signed in user in your application.
    email: email,                             // Email of the currently signed in user.
    created_at: parseInt(new Date() / 1000),  // Timestamp in your system that represents when
                                              // the user first signed up. You'll want to send it
                                              // as seconds since the epoch.
  });
}

document.pricingSignup.addEventListener('submit', function(e) {
  e.preventDefault();
  var email = document.getElementById('pricing-signup-email').value;

  if (!signedupContent.classList.contains('hidden')) {
    toggleModal();
  }

  else if (isEmail(email)) {
    signupContent.classList.toggle('hidden');
    signedupContent.classList.toggle('hidden');
    coIdentify(email);
  }

  else {
    document.getElementById('pricing-signup-message').classList.toggle('hidden');
  }
})

document.sampleSignup.addEventListener('submit', function(e) {
  e.preventDefault();
  var email = document.getElementById('sample-signup-email').value;

  if (!signedupContent.classList.contains('hidden')) {
    toggleModal();
  }

  else if (isEmail(email)) {
    signupContent.classList.toggle('hidden');
    signedupContent.classList.toggle('hidden');
    toggleModal();
    coIdentify(email);
  }

  else {
    document.getElementById('sample-signup-message').classList.toggle('hidden');
  }
})
