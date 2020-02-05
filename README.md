### R Code Samples

R education code and examples.

------------------------------------------------------------------
### Notes

#### The [] Operator
You need [[ when working with lists. This is because when [ is applied to a list it always returns a list: it never gives you the contents of the list. To get the contents, you need [[:

https://www.quora.com/What-is-the-difference-between-and-in-R

#### typeof() vs. class()
The typeof() function indicates how an object is stored in the computer's memory whereas class() returns its abstract type. 

Object-oriented languages like R typically have what's called base classes.  Take, for instance, a base class called animal.  Now animal is a rather abstract idea (construct), though there are a few attributes that all animals share in common.  Now if R had a base class named animal (it doesn't), I could create a new class named dog that inherits all of the functionality found in animal, including its methods and attributes.  A method is simply something the animal class can do.  For example, all animals can move.  Thus my new dog class -- inherited from animal -- also inherits the move method and would be called like this in code: dog.move() 

Now if I want to know the class of dog, I'd write class(dog) and R would return animal as dog's base class.  The way dog is stored in computer memory, on the other hand, is something altogether different.  It might be stored as a list or as a complex datatype of some sort.
