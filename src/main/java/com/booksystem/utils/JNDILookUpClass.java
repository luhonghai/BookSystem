package com.booksystem.utils;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.Hashtable;

/**
 * Created by longnguyen on 2/3/15.
 */
public class JNDILookUpClass {
    private static Context initialContext;

    private static final String PKG_INTERFACES = "org.jboss.ejb.client.naming";

    /**
     *
     * @return
     * @throws NamingException
     */
    public static Context getInitialContext() throws NamingException {
        if (initialContext == null) {
            final Hashtable jndiProperties = new Hashtable();
            jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");

            initialContext = new InitialContext(jndiProperties);
        }
        return initialContext;
    }

    /**
     *
     * @return
     * @throws NamingException
     */
    public static Context getInitialContextClient() throws NamingException {
        if (initialContext == null) {
            final Hashtable jndiProperties = new Hashtable();
            jndiProperties.put("jboss.naming.client.ejb.context", true);
            jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.naming.remote.client.InitialContextFactory");
            jndiProperties.put(Context.PROVIDER_URL,  "remote://localhost:4447");
            jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
            jndiProperties.put(Context.SECURITY_PRINCIPAL, "testuser");
            jndiProperties.put(Context.SECURITY_CREDENTIALS, "testuser123");

            initialContext = new InitialContext(jndiProperties);
        }
        return initialContext;
    }

    /**
     *
     * @param className
     * @param beanClass
     * @return
     */
    public static String lookUpName(String className, String beanClass){
        /*The app name is the EAR name of the deployed EJB without .ear
        suffix. Since we haven't deployed the application as a .ear, the app
        name for us will be an empty string */
        String appName = "";

        /* The module name is the JAR name of the deployed EJB without the
        .jar suffix.*/
        String moduleName = "booksystem";

        /* AS7 allows each deployment to have an (optional) distinct name.
        This can be an empty string if distinct name is not specified.*/
        String distinctName = "";

        // The EJB bean implementation class name
        String beanName = beanClass;

        // Fully qualified remote interface name
        final String interfaceName = className;

        // Create a look up string name
        String name = "ejb:" + appName + "/" + moduleName + "/" + distinctName + "/" + beanName + "!" + interfaceName;

        return name;
    }
}
