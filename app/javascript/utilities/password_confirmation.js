document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.password_validate')

    const passwordField = control.querySelector('#user_password')
    const passwordConfField = control.querySelector('#user_password_confirmation')

    if (control) control.addEventListener('input', passwordConfirmation)

    function passwordConfirmation() {
        if (passwordField.value === "" && passwordConfField.value === "") {
            this.querySelector('.octicon-x-circle-fill').classList.add('hide')
            this.querySelector('.octicon-check-circle-fill').classList.add('hide')
        } else if(passwordField.value === passwordConfField.value) {
            this.querySelector('.octicon-x-circle-fill').classList.add('hide')
            this.querySelector('.octicon-check-circle-fill').classList.remove('hide')
        } else {
            this.querySelector('.octicon-x-circle-fill').classList.remove('hide')
            this.querySelector('.octicon-check-circle-fill').classList.add('hide')
        }
    }
})
