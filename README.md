peregrine cms developer toolbox
----

in case you want to work on peregrine but only have docker (desktop) installed on your computer (no java, maven)

## Build an image compatible with your local right

```
git clone https://github.com/Mayeu/peregrine-toolbox-explore/
docker build docker build \
          --build-arg HOST_UID=$(id -u) \
          --build-arg HOST_USER=$(whoami) \
          -t local-peregrine-toolbox .
```

create an emppty folder somewhere on your computer and change your directory into it

```
mkdir peregrine
cd peregrine
```

then run the docker image you just created: 

- windows: 

```
docker run -it -p 8080:8080 -v "%CD%:/peregrine" local-peregrine-toolbox
```

- other platforms

```
docker run -it -p 8080:8080 -v $(PWD):/peregrine local-peregrine-toolbox
```

you should get a shell 

to setup a development environment for peregrine execute the following commands: 

```
clone.sh
develop-next.sh
start-peregrine.sh
build-all.sh
```

_note 1_: start-peregrine.sh is run with &, hit enter to get another command prompt to execute the build-all.sh file

_note 2_: the process takes a while :-( but at least this is only happening the first time

After the install is complete you can go to http://localhost:8080/ and log in with admin/admin to access the instance

If you exit out of the shell peregrine is stopped

## run peregrine at a later point

To run peregrine again just go the folder you created in the beginning and execute

```
docker run -it -p 8080:8080 -v $(PWD):/peregrine local-peregrine-toolbox
```

in the resulting shell you can then run

```
start-peregrine.sh
```

to startup peregrine again and open your browser at http://localhost:8080/
