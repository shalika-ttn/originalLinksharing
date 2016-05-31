package com.ttnd.linksharing.CO

import com.ttnd.linksharing.User

class UpdatePasswordCo {


    String oldPassword
    String password
    String confirmPassword
    String id

    static constraints =
            {
                importFrom(User, include: ['password'])

                oldPassword(validator: {
                    value, UpdatePasswordCo updatePasswordCo ->

                        if (!(value && value.equals(updatePasswordCo.getUser()?.password))) {
                            return "Enter the current password correctly."
                        }
                })



                confirmPassword(validator: {
                    value, UpdatePasswordCo updatePasswordCo ->

                        if (!(value && value.equals(updatePasswordCo.password))) {
                            return "Confirm password and new password do not match."
                        }
                })
            }


    User getUser(Long id) {
        User user = User.findByid(id)
    }
}
