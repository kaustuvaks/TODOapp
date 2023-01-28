# TODOapp

### This project shows us the usage of a TODO app. It also has a mailing service and an auto update service which updates task status wrt time.
## Points to be noted
##### JSP lifecycle  

1) Translation of JSP to Java (servlet).  
2) Compilation of java to .class.  
3) Loading of servlet class.  
4) Instantiation(no-arg constructor).  
5) Initialization(init method).  
6) Invoke service() method in a new thread of execution(which in turn invoke doXXX methods).  
7) Destroy(destroy method)  

*Note: Since servlet is a singleton, from 2nd request first 5 steps will not be performed. From 2nd request service() method is invoked in a new thread of execution.*  

###### <% %>  -> Scriplet tag(multiline java code) is copy pasted as is in service method.  
###### <%= %> -> Expression tag goes inside out.print(executable java code). Executable java code is executed and returned to out.print()  
###### <%! %> -> Declartion tag is copy pasted as is inside converted java servlet class but outside service() method.  
