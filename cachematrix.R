## Put comments here that give an overall description of what your functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

	# initialisation inverse matrix
	i <- NULL

	# function that sets (cached) matrix and (re)sets (cached) inverse matrix 	
	set <- function(y) {
		x <<- y
		i <<- NULL
	}

	# function that returns maxtrix
	get <- function() x

	# function that set inverse matrix
	setInverseMatrix <- function(solve) i <<- solve
	
	# function that returns inverse matrix
	getInverseMatrix <- function() i

	# the following statement stores the four functions defined above
	list(set=set, get=get, setInverseMatrix=setInverseMatrix, getInverseMatrix=getInverseMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x = matrix(), ...) {

	# get inverse matrix
	i <- x$getInverseMatrix()
	
	# check whether the inverse matrix exists
	if(!is.null(i)) return(i)

	# if no inverse matrix exists, get the one that is given by the makeCacheMatrix function call
	matrix <- x$get()
	
	# inverse the matrix
	i <- solve(matrix, ...)
	
	# cache the matrix	
	x$setInverseMatrix(i)
	
	# return inverse matrix
	i
}