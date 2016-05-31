// Place your Spring DSL code here

beans = {

    myBean(com.ttnd.linksharing.MyCustomBean)   {bean ->
                bean.scope='prototype'
                firstname="shubhangi"
                lastname="garg"
            }

    myBeanUsingConstructor(com.ttnd.linksharing.MyCustomBean,"shubhi","saraswat")
            {

            }


    myBean2(com.ttnd.linksharing.DemoEmployee) {

        firstname="shubhangi"
        lastname="garg"
            }
}
