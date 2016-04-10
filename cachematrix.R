## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
## makeCacheMatrix to set and get a matrix value of the input matrix, 
## which will to be used by function cacheSolveto 
## set an inverse matrix, get an inverse matrix.
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinv_m <- function(inv_m) m <<- inv_m
      getinv_m<- function() m
      list(set = set, get = get,
           setinv_m = setinv_m,
           getinv_m = getinv_m)
}

## Write a short comment describing this function
## it get an original matrix from function makeCacheMatrix
## varify the value m, if it exists in memory and is not NULL,
## it returns a message and the value.
## else if original matrix is a square matrix, solve an inverse matrix 
##by use R solve() function;else return a message.
##for non nXn matrix  to return a message "Input matrix must be a 
##square matrix."

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getinv_m()
      data <- x$get()  #get original matrix
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      else if( nrow(data)==ncol(data)){  #if input matrix is square matrix
            m <- solve(data, ...)   
            x$setinv_m(m)
            m    
      }
      else
      {     
      message("Input matrix must be a square matrix.  ")
      }
}
