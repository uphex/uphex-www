var prelaunchBtns = document.getElementsByClassName('js-prelaunch-modal');
var modal = document.getElementById('modal');
var overlay = document.getElementById('overlay');
var body = document.getElementsByTagName('body')[0];

for (var i = 0; i < prelaunchBtns.length; i++) {
  prelaunchBtns[i].addEventListener('click', function(e) {
    e.preventDefault();
    toggleModal();
  }, false)
}

overlay.addEventListener('click', function(e) {
  if (e.target.id == 'overlay') {
    toggleModal();
  }
}, false)

function toggleModal() {
  body.classList.toggle('frozen');
  modal.classList.toggle('hidden');
}
