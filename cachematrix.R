#Taking the example of how to cache the mean of vector, I've edited the two functions so that the first creates a special "matrix" object which: sets the value of the matrix, gets the value of the matrix, sets the value of the inverse and gets the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
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

#The second function either calculates the inverse of this special "matrix" or retrieves the inverse from the cache (if it's already been calculated). The first part looks to see if the inverse has already been calculated and then returns the cached inverse. If it's not already calculated, it gets the cached matrix, then calulates, caches, and prints the inverse.
          
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
    if(!is.null(inv)) {
    message("getting cached data")
    return(i)
    }
  #If not, 
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}

#Testing

testMatrix <- diag(4,1000)
testCache <- makeCacheMatrix(testMatrix)
testSolve <- cacheSolve(testCache)
testSolve[1:3,1:3]

[,1] [,2] [,3]
[1,] 0.25 0.00 0.00
[2,] 0.00 0.25 0.00
[3,] 0.00 0.00 0.25
