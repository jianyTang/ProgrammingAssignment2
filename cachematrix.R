## function of makeCacheMatrix  
## set the value of input matrix
## get the value of input matrix
## set the value of inv_m (inverse matrix)
## get the value of inv_m (inverse matrix)

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

## get an original matrix from function makeCacheMatrix
## varify the value m, if it exists in memory and is not NULL,
## it returns a message and the value.
##  else if original matrix is a square matrix, solve an inverse matrix 
## by use R solve() function
## else input is not square matrix, return a message.

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      m <- x$getinv_m()
      data <- x$get()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      else if( nrow(data)==ncol(data)){  
            m <- solve(data, ...)   
            x$setinv_m(m)
            m    
      }
      else
      {     message("Input matrix must be a square matrix.  ")
            
      }
      
}







