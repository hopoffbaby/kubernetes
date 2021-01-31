Quickstart
Note: For versions before Kubernetes v1.20.z refer to the Kubernetes compatibility matrix in order to choose a compatible branch.

This project is intended to be used as a library (i.e. the intent is not for you to create your own modified copy of this repository).

Though for a quickstart a compiled version of the Kubernetes manifests generated with this library (specifically with example.jsonnet) is checked into this repository in order to try the content out quickly. To try out the stack un-customized run:

Create the monitoring stack using the config in the manifests directory:
# Create the namespace and CRDs, and then wait for them to be availble before creating the remaining resources
kubectl create -f prometheus/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f prometheus/
We create the namespace and CustomResourceDefinitions first to avoid race conditions when deploying the monitoring components. Alternatively, the resources in both folders can be applied with a single command kubectl create -f manifests/setup -f manifests, but it may be necessary to run the command multiple times for all components to be created successfullly.

And to teardown the stack:
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
Access the dashboards
Prometheus, Grafana, and Alertmanager dashboards can be accessed quickly using kubectl port-forward after running the quickstart via the commands below. Kubernetes 1.10 or later is required.

Note: There are instructions on how to route to these pods behind an ingress controller in the Exposing Prometheus/Alermanager/Grafana via Ingress section.

Prometheus

$ kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090
Then access via http://localhost:9090

Grafana

$ kubectl --namespace monitoring port-forward svc/grafana 3000
Then access via http://localhost:3000 and use the default grafana user:password of admin:admin.

Alert Manager

$ kubectl --namespace monitoring port-forward svc/alertmanager-main 9093
Then access via http://localhost:9093