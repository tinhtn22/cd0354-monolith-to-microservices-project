docker build -t udagram-api-feed ./udagram-api-feed
docker build -t udagram-api-user ./udagram-api-user
docker build -t udagram-frontend ./udagram-frontend
docker build -t reverseproxy ./udagram-reverseproxy

docker tag udagram-api-feed tinhtn/udagram-api-feed:latest
docker tag udagram-api-user tinhtn/udagram-api-user:latest
docker tag udagram-frontend tinhtn/udagram-frontend:latest
docker tag reverseproxy tinhtn/reverseproxy:latest

docker push tinhtn/udagram-api-feed:latest
docker push tinhtn/udagram-api-user:latest
docker push tinhtn/udagram-frontend:latest
docker push tinhtn/reverseproxy:latest
