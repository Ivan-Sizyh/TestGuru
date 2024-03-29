document.addEventListener('DOMContentLoaded', function () {
    let controls = document.querySelectorAll('.form-inline-link')

    if (controls.length) {
        for (let i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }

        let errors = document.querySelector('.resource-errors')

        if (errors) {
            formInlineHandler(errors.dataset.resourceId)
        }
    }

    function formInlineLinkHandler(event) {
        event.preventDefault()
        formInlineHandler(this.dataset.testId)
    }

    function formInlineHandler(testId) {
        let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
        let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
        let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

        if (formInline.classList.contains('hide')) {
            testTitle.classList.add('hide')
            formInline.classList.remove('hide')
            link.textContent = 'Отменить'
        } else {
            testTitle.classList.remove('hide')
            formInline.classList.add('hide')
            link.textContent = 'Редактировать'
        }
    }
})
