# Introduction 

* karate api test automation framework

# Getting Started

TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:

1.	Installation process

* To install - use one the following build & test commands
	
2.	Software dependencies

* Maven - https://maven.apache.org/
* Java - https://www.oracle.com/java/technologies/javase-jdk8-downloads.html

3.	Latest releases

4.	API references

* Karate - https://github.com/intuit/karate

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

### ALL - Run all features
```
mvn clean test -Dkarate.env=dev_funcApp -Dkarate.options="--tags @testAPI" -Dtest=TestRunner
```

### SELECTIVE - Run only those features having tag @functionality1
```
mvn clean test -Dkarate.env=dev_funcApp -Dkarate.options="--tags @functionality1" -Dtest=TestRunner
```

### OR - Run every feature that has either of the @functionality1 and @functionality2 tags (runs both)
```
mvn clean test -Dkarate.env=dev_funcApp -Dkarate.options="--tags @functionality1,@functionality2" -Dtest=TestRunner
```

### AND - run every feature that has both @functionality1 and @functionality2 tags.
```
mvn clean test -Dkarate.env=dev_funcApp -Dkarate.options="--tags "@functionality1", "@functionality2"" -Dtest=TestRunner
```

### Combining OR and AND - run feature that has either of @functionality1,@functionality2 tags but not @functionality3 tag.
```
mvn clean test -Dkarate.env=dev_funcApp -Dkarate.options="--tags ""@functionality1,@functionality2","~@functionality3"" -Dtest=TestRunner
```

## Running Gatling Test
```
mvn clean test-compile gatling:test
```

# Contribute
TODO: Explain how other users and developers can contribute to make your code better.

* Writing tests - https://github.com/intuit/karate
* Code review
* Other guidelines 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)


### Who do I talk to? ###

* Kamal Shingala (kshingala@deloitte.com.au)