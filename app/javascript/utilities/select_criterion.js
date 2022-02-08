document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.event_params')
    const field = document.querySelector('#badge_event')
    const criterion = document.querySelector('#badge_criterion')

    if(control) {
        defaultCriterion()
        field.addEventListener('change', defaultCriterion)
    }

    function defaultCriterion() {
        if (field.options[field.selectedIndex].text === 'Все тесты пройдены') {
            criterion.value = 'Все тесты пройдены'
        }
        else {
            criterion.value = ''
        }
    }
})
