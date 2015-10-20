var prelaunchBtns = document.getElementsByClassName('js-prelaunch-modal');
var modal = document.getElementById('modal');
var body = document.getElementsByTagName('body')[0];

for (var i = 0; i < prelaunchBtns.length; i++) {
  prelaunchBtns[i].addEventListener('click', function(e) {
    e.preventDefault();
    body.classList.toggle('frozen');
    modal.classList.toggle('hidden');
  }, false)
}
