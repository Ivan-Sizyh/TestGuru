document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('#new_user')

    if (control) control.addEventListener('input', passwordConfirmation)
})

function passwordConfirmation() {
    let password_field = this.querySelector('#user_password')
    let password_conf_field = this.querySelector('#user_password_confirmation')

    if (password_field.value === "" && password_conf_field.value === "") {
        this.querySelector('.octicon-x-circle-fill').classList.add('hide')
        this.querySelector('.octicon-check-circle-fill').classList.add('hide')
    } else if(password_field.value === password_conf_field.value) {
        this.querySelector('.octicon-x-circle-fill').classList.add('hide')
        this.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    } else {
        this.querySelector('.octicon-x-circle-fill').classList.remove('hide')
        this.querySelector('.octicon-check-circle-fill').classList.add('hide')
    }
}
