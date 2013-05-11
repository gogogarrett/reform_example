# Reform Example

This is a sample application to show how you can take [Reform](https://github.com/apotonick/reform) and integrate it into a Rails project.

# Forms

The form class stays very simple thanks to Reform's easy to use DSL that creates the necessary classes under the hood, but if your application needs extra configurations or entirely different functionality altogether, fear not.  Just override the classes your self and do it.

# Services

Services are great to iosolate code into very dumb and simple classes that are responsible for one thing.

Here I am using a ManageUser service class that allows you to simply pass in the params you're working with and call the respected method to create or update the resources.

# Workflows

I am using workflows to eliminate the controllers from having to care about logic. I am abstracting that into a single workflow class that is responsible for running the validations, and if successfull delegating to correct Services to handle the data.
