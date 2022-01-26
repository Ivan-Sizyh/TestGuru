document.addEventListener('turbolinks:load', function () {
    const progressBar = document.querySelector('.progress_bar_fill')

    if(progressBar) {
        progressBar.style.width = `${progressBar.dataset.progress}%`
        progressBar.textContent = `${progressBar.dataset.progress}%`
    }
})
