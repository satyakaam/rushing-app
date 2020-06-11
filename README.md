## Prerequisite

- Docker https://docs.docker.com/get-docker/

## Backend
It contains the API for the task, written in Rails. 

### Installation

```bash
cd backend
docker-compose build
docker-compose up
```

### Usage
To run test cases
```bash
rspec
```

To view the json endpoint
```
localhost:3000/players
```
For pagination
```
localhost:3000/players?page=2
```
To download CSV
```
localhost:3000/players/download
```
To apply filters
```
http://localhost:3000/players?search=Joe&sort=total_yards
```
To download csv with filters
```
http://localhost:3000/players/download?search=Joe&sort=total_yards
```

## Frontend

It contains the view for task, written in reactJS. 

### Installation


```bash
cd frontend/rush-react-app
docker-compose build
docker-compose up
```

### Usage

```
localhost:3001
```
