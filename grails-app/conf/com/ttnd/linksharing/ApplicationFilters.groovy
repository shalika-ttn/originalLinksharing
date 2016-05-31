package com.ttnd.linksharing

class ApplicationFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                log.info "User Controller"
                log.info "Login Controller"
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
//        sessioncheck() {}
//        logincheck(controller: 'login', invert: true) {
//            before = {
//                println "================================================"
//                if (!session.user)
//                    redirect(controller: 'login', action: 'index')
//
//
//            }
//
//        }
        consolecheck(controller: 'console') {
            before = {
                println "================================================"
                if (session.user?.admin)
                {  println("==========allowed==========")

                }
                else
                    redirect(controller: 'user',action: 'index')


            }

        }
//
//
    }
    }
