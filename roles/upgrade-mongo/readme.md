---

# Upgrade the MongoDB replicaset

## Preparation of the environment

```bash
USERNAME=mongod
GROUPNAME=mongod
useradd -M $USERNAME
usermod -L $USERNAME
groupadd $GROUPNAME
usermod -a -G $GROUPNAME $USERNAME
```