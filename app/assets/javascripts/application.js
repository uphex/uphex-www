var prelaunchBtns = document.getElementsByClassName('js-prelaunch-modal');
var modal = document.getElementById('modal');

for (var i = 0; i < prelaunchBtns.length; i++) {
  prelaunchBtns[i].addEventListener('click', function(e) {
    e.preventDefault();
    modal.classList.toggle('hidden');
  }, false)
}
