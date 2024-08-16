# The Odin Project - Knights Travails

From the project description: 
> Your task is to build a function knight_moves that shows the shortest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

Tackling this project has actually been fairly straightforward. 
Now being used to OOP I started with creating a `Knight` class. 
I stored all valid knight moves in a graph structure as a class attribute.
Since the assignment does not contain any other pieces on the chess board the knight can always make all the possible moves without obstruction. 

For the shortest path I used a *Breadth First Search* algorithm. 
- It starts on the starting square. 
- Then it explores all squares it can reach from there
- Then it explores all squares it can reach from each of those squares. 
- And so on, until the target square is found. 
To avoid infinite loops I also keep track of which squares have already been visited.

When the target square is found I need to trace back the path that was followed. 
To be able to do this I created a `Node` class which holds the square in the data attribute, and also the parent Node in the parent attribute.
That way I can list the target node, then its parent, then its parent, etc. until I am back at the starting node.

All in all this project was not as challenging as I expected it to be, but it was fun. 
