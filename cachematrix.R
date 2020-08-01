## The first function, makeVector creates a special "matrix", which is really a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

## creates a special matrix and can get its value and set its value, also avaliable to find its inverse and set it

makeCacheMatrix <- function(x = matrix()) {
         i <- NULL
            set <- function(y){
                  x <<- y
                  i <<- NULL
            }
            get <- function() x
            setinverse <- function(inverse) i <<- inverse
            getinverse <- function() i
            list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
}


## The following function calculates the inverse of the special "matrix" created with the above function. 
## First check the inverse if it has been calcualted and calculate the inverse if not 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
