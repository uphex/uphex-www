var prelaunchBtns = document.getElementsByClassName('js-prelaunch-modal');
var overlay = document.getElementById('overlay');
var modal = document.getElementById('modal');
var content = document.getElementById('modal-content');
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
  modal.classList.toggle('hidden');
  modal.classList.toggle('fade-in');
}

document.signup.addEventListener('submit', function(e) {
  e.preventDefault();
  //customer io stuff goes here
})
