To build app and containers

```bash
gradlew assemble
docker build .
docker tag <image> curator-test:0.0.2
```

To run the test

```bash
# Standup zookeeper and wait for it to be healthy
docker-compose up -d zookeeper1 zookeeper2 zookeeper3 

# Stand up a server and make sure it is connected and working as expected
docker-compose up -d server1

# Take down a single zookeeper node and stand up another agent.
# The agent will grab the old zookeepers IP address
docker-compose rm -s zookeeper1
docker-compose up -d server2

# Bring the zookeeper node back up.  
# Wait for it be healthy
docker-compose up -d zookeeper1

# Then take down the next zookeeper node and stand up another agent.
# The agent will grab the old zookeepers IP address
docker-compose rm -s zookeeper2
docker-compose up -d server3

# Bring the zookeeper node back up. 
# Wait for it be healthy
docker-compose up -d zookeeper2

# Then take down the next zookeeper node and stand up another agent.
# The agent will grab the old zookeepers IP address
docker-compose rm -s zookeeper3 
docker-compose up -d server4 

# Bring the zookeeper node back up. 
# Wait for it be healthy 
docker-compose up -d zookeeper3
```