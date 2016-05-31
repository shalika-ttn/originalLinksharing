package com.ttnd.linksharing

class MyCustomBean {

    String firstname
    String lastname


    MyCustomBean()
     {

     }

    MyCustomBean(String fname, String lname)
    {
         println("===========calling constructor===================")

        firstname=fname
        lastname=lname
    }

    String getFirstname() {
        return firstname
    }

    void setFirstname(String firstname) {

        println "===============heeeeeeelooo firstname==============="
        this.firstname = firstname
    }

    String getLastname() {
        return lastname
    }

    void setLastname(String lastname) {

        println "===============heeeeeeelooo lastname==========="
        this.lastname = lastname
    }
}
