## The below functions can cache the inverse of a matrix and retrieve the cached value instead of recomputing when needed.

## This function creates a matrix that caches its inverse.

makeCacheMatrix <- function(x = matrix()) {
              n <- NULL
            set <- function (y) {
             x <<- y
             n <<- NULL
}
            get <- function ()x
         setInv <- function (Inv) n <<- Inv
         getInv <- function ()n
         list (set = set, get = get, 
               setInv = setInv, getInv = getInv)
}

## The following function calculates the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setInv function.

cacheSolve <- function(x, ...) {
            n <- x$getInv()
            if(!is.null(n)) {
            message ("getting cached matrix")
            return (n)
}
          matrix <- x$get()
               n <- solve(matrix, ...)
               x$setInv (n)
               n
}
