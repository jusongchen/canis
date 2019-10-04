
# Canis

A starter app which is kubernetes-ready



 
# Helm Chart deployment notes


kubectl create -f clusterrole.yaml
kubectl create serviceaccount -n kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller


Notes and workaround:

Error:
$ helm init --service-account tiller
$HELM_HOME has been configured at /Users/jusong.chen/.helm.
Error: error installing: the server could not find the requested resource

helm init --service-account tiller --override spec.selector.matchLabels.'name'='tiller',spec.selector.matchLabels.'app'='helm' --output yaml | sed 's@apiVersion: extensions/v1beta1@apiVersion: apps/v1@' | kubectl apply -f -



Verify tiller:

$ kubectl --namespace kube-system get pods | grep tiller
tiller-deploy-77855d9dcf-xvmt4     1/1     Running   0          104s


## install app

helm install  ./canis-helm-chart
### check pod status
kubectl get pod
### check app log
kubectl logs honking-grizzly-canis-764c9c6fcc-gzmrq

## check service
kubectl get svc --watch

minikube service example-service --url


## uninstall an App

helm list to show apps
```
$ helm list
NAME               	REVISION	UPDATED                 	STATUS  	CHART      	APP VERSION	NAMESPACE
wonderful-crocodile	1       	Thu Oct  3 09:56:07 2019	DEPLOYED	redis-9.2.2	5.0.5      	default
```

helm delete wonderful-crocodile



