# custom haproxy

Due to the fact that in Openshift 3.1 the default router template have hardcoded the listening ports in need to create my own template.

Ho to use and build is described here

https://docs.openshift.com/enterprise/3.1/install_config/install/deploy_router.html#deploying-a-customized-haproxy-router

You can test it with this commands

```
oc new-app https://github.com/git001/openshift_custom_haproxy_ext.git --name=infra-router
oc scale rc infra-router-2 --replicas=0
oc env dc/infra-router ROUTER_SERVICE_HTTP_PORT=9080 ROUTER_SERVICE_HTTPS_PORT=9443 ROUTE_LABELS="route=intern" TZ="UTC"
oc scale rc infra-router-2 --replicas=2
```

## Openshift 3.2

In 3.2 the feature was added to set the listening ports over environment variables.

https://docs.openshift.com/enterprise/3.2/install_config/install/deploy_router.html#customizing-the-router-service-ports

I have setuped this template in the same way to be able to use it similar as in 3.2.

After the image is builded you can now use the same syntax as describe in the 3.2 doc.

# router setup

```
oadm router infra-router -n default \
 --credentials=/etc/origin/master/openshift-router.kubeconfig \
 --service-account=router \
 --host-network=true \
 --images='default/infra-router:latest' \
 --selector='region=infra' \
 --labels="route=intern" \
 --ports='9080:9080,9443:9443' \
 --stats-port=1938 
```

oc env -n default dc/infra-router ROUTER_SERVICE_HTTP_PORT=9080 ROUTER_SERVICE_HTTPS_PORT=9443 ROUTE_LABELS="route=intern" TZ="UTC"

# External dependency

On the nodes on which the haproxy runs needs to open the ports with iptables.


