## The functions below work by creating a square invertible matrix
## and storing the inverse of the matrix in cache





## makeCacheMatrix builds and returns a list of functions
## in order for cacheSolve to retrive or store 
## the inverted matrix in cache

makeCacheMatrix <- function(x = matrix()) {

        # set localcache to NULL
        localcache <- NULL
  
        # build matrix in working environment
        store <- function(z) {
                x <<- z
                localcache <<- NULL
        }
  
        # retrive value of the matrix
        retrive <- function() x
        # invert the matrix and store in localcache
        storeMatrix <- function(inverse) localcache <<- inverse
        # retrive inverted matrix from localcache
        retriveInverse <- function() localcache
  
        # return functions
        list(store = store, retrive = retrive,
             storeMatrix = storeMatrix,
             retriveInverse = retriveInverse)
}


## cacheSolve solves the inverse for the matrix created with makeCacheMatrix
## If cached inverse does not already exist it stored it

cacheSolve <- function(x, ...) {
        ## retrive inverse stored in localcache
        localcache <- x$retriveInverse()
  
        # if localcache null it will create the matrix
        if (!is.null(localcache)) {
                # return stored matrix
                return(localcache)
        }
        # create stored matrix
        matrix <- x$store()
        # retrive and solve inverse
        localcache <- solve(matrix, ...)
        # store results
        x$storeMatrix(localcache)
  
        # return stored matrix
        return (localcache)
}
