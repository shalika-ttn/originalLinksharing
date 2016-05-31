package com.ttnd.linksharing

class DemoEmployee {
    String firstname
    String lastname


    static constraints = {


    }

//        MyCustomBean()
//        {
//
//        }
//
//        MyCustomBean(String fname, String lname)
//        {
//            println("===========calling constructor===================")
//
//            firstname=fname
//            lastname=lname
//        }

    String getFirstname() {
        return firstname
    }

    void setFirstname(String firstname) {

        println "===============heeeeeeelooo firstname domainnnnnnnnnnnn==============="
        this.firstname = firstname
    }

    String getLastname() {
        return lastname
    }

    void setLastname(String lastname) {

        println "===============heeeeeeelooo lastname domainnnnnnnnnnnnnnnnnnn==========="
        this.lastname = lastname
    }


}
