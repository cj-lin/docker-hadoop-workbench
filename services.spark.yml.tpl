version: "2"

services:

## sparkmaster
  sparkmaster-${i}:
    container_name: sparkmaster-${i}
    networks: ["${network_name}"]
    hostname: sparkmaster-${i}.${network_name}
    image: bde2020/spark-master
    ports:  [8080]
    environment:
      SPARK_PUBLIC_DNS: ${host_name}
##/ sparkmaster

## sparkworker
  sparkworker-${i}:
    container_name: sparkworker-${i}
    networks: ["${network_name}"]
    hostname: sparkworker-${i}.${network_name}
    image: bde2020/spark-worker
    ports:  [8081]
    depends_on: ["sparkmaster-1"]
    environment:
      SPARK_MASTER: spark://sparkmaster-1.${network_name}:7077
      SPARK_PUBLIC_DNS: ${host_name}
##/ sparkworker