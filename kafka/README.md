# Kafka

If you want to run kafka in cluster,in current folder run:

```bash
docker-compose up
```

After that

```bash
docker ps
```

You can find that there 3 containers started which named kafka-master, kafka-slave1, kafka-slave2

Then go inside the Master node, which is kafka-master.

```bash
docker exec -it kafka-master zsh
jps
```

If you want to stop kafka, in current folder run:

```bash
docker-compose down
```
