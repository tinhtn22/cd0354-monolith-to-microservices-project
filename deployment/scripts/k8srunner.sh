kubectl delete --all pods,services,deployments

kubectl apply -f ./deployment/aws-secret.yaml
kubectl apply -f ./deployment/env-secret.yaml
kubectl apply -f ./deployment/env-configmap.yaml
kubectl apply -f ./deployment/feed-deploy.yaml
kubectl apply -f ./deployment/user-deploy.yaml
kubectl apply -f ./deployment/frontend-deploy.yaml
kubectl apply -f ./deployment/reverseproxy-deploy.yaml
kubectl apply -f ./deployment/feed-service.yaml
kubectl apply -f ./deployment/user-service.yaml
kubectl apply -f ./deployment/frontend-service.yaml
kubectl apply -f ./deployment/reverseproxy-service.yaml
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy --port=8080

kubectl autoscale deployment api-feed --cpu-percent=70 --min=2 --max=3
kubectl autoscale deployment api-user --cpu-percent=70 --min=2 --max=3
kubectl autoscale deployment frontend --cpu-percent=70 --min=2 --max=3
kubectl autoscale deployment reverseproxy --cpu-percent=70 --min=2 --max=3

kubectl get deployments
kubectl get services
kubectl get pods
kubectl get hpa