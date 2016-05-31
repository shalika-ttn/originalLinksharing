package com.ttnd.linksharing

import org.apache.commons.lang.RandomStringUtils

class Utill {

    static String getRandomPassword() {
        RandomStringUtils randomPassword = new RandomStringUtils();
        return randomPassword.randomAlphanumeric(6)
    }
}
