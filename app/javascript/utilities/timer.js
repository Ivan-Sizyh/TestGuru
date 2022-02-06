document.addEventListener('turbolinks:load', function () {
    const timer = document.querySelector('.timer');
    if(timer) {
        let time = timer.dataset.time;

        const form = document.querySelector('.result-form');

        let x = setInterval(function() {
            let now = new Date().getTime();

            let distance = time - now;

            if (distance <= 0) {
                clearInterval(x);
                form.submit();
                return
            }

            let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            let seconds = Math.floor((distance % (1000 * 60)) / 1000);

            timer.textContent = `${minutes} мин ${seconds} сек`;
        }, 1000);
    }
})
