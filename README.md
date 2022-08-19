# golang project template managed with tasksfile/make
A cookiecutter template for [golang](https://go.dev) projects managed by [Taskfile](https://taskfile.dev)

## 🍭 Goodies
* Taskfiles support easy to extend
* Basic `Makefile` support
* Uses [testify](https://github.com/stretchr/testify) as Test framework
* Provides a golang scafold ready to use

## 🎬 Getting Started
* Alfter cloning the repository you should complete the data for your project, to help you with thist [here](./cookicutter.json.sample), de default name for the configuration file is `cookiecutter.json` but takin a look to the [`Makefile`](./Makefile) I'm pretty sure that you can figure out how to have several project configurations ;)
* Generate the scafold for your project doing
  ```bash
  make clean generate
  ```
  then you can find the project structure insie the `./dist` folder

## 📌 Todo
* Provide a stronger set of unit tests
* Better use of the post-hook scripts to achieve a complete explerience, for example being able to:
    - Adding go modules configurables is some way
    - Generating all the git burden for the project
