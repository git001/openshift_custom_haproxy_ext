# custom haproxy

Due to the fact that in Openshift 3.1 in the default router template the listening ports are hardcoded we need to create our own template.

In 3.2 was the feaute added to set the listening ports over environment variables.

https://docs.openshift.com/enterprise/3.2/install_config/install/deploy_router.html#customizing-the-router-service-ports

I have setuped this template in the same way to be able to use the setup also in 3.2.

After the image is builded you can now use the same syntax as describe in the 3.2 doc.


