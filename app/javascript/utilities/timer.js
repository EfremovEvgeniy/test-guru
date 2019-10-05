document .addEventListener('turbolinks:load', function(){
    var timer = document.querySelector('.timer');
    if (timer) {
        var countDown = timer.dataset.time
        var testPassageId = timer.dataset.testPassageId
        var updateCountDown = setInterval(function() {
            countDown--;
            minutes = parseInt(countDown / 60, 10)
            seconds = parseInt(countDown % 60, 10);
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            timer.innerHTML = minutes +":" +seconds;
            if (countDown <= 0) {
                clearInterval(updateCountDown);
                timer.innerHTML = "Time is over";
                var form = document.getElementById('nextQuestion');
                form.click();
            }
        }, 1000);
    }
})
