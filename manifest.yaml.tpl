# Deployment

apiVersion: apps/v1
kind: Deployment
metadata:
  name: propeller-deployment
  labels:
    app: web
spec:
  selector:
    matchLabels:
      app: web
  replicas: 3
  strategy:
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: propeller-test
        image: europe-west1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/propeller-images/propeller-test
        ports:
        - containerPort: 3000
---

# Service

apiVersion: v1
kind: Service
metadata:
  name: propeller-service
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 3000
    protocol: TCP
  selector:
    app: web
