## makeCacheMatrix is a (main) function that stores four functions:
	## 1 set (changes/stores the matrix stored in the main function)
	## 2 get (returns the matrix stored in the main function)
	## 3 setInverseMatrix (changes/stores the inverse matrix in the main function)
	## 4 getInverseMatrix (returns the inverse matrix stored in the main function)
## these four functions can be called from the cacheSolve function (see below)
## x <<- y makes the matrix available in the whole (main) function (same applies with i <<- solve)
## e.g. function call: 
	## a <- matrix(c(1,2,3,4),2,2)
	## w <- makeCacheMatrix(a) 
## please find additional comments in the function definition as stated below:

makeCacheMatrix <- function(x = matrix()) {

	# initialisation inverse matrix
	i <- NULL

	# function that sets matrix and (re)sets inverse matrix 	
	set <- function(y) {
		x <<- y
		i <<- NULL
	}

	# function that returns maxtrix
	get <- function() x

	# function that sets inverse matrix
	setInverseMatrix <- function(solve) i <<- solve
	
	# function that returns inverse matrix
	getInverseMatrix <- function() i

	# the following statement stores the four functions defined above
	list(set=set, get=get, setInverseMatrix=setInverseMatrix, getInverseMatrix=getInverseMatrix)
}

## cacheSolve is a function that:
	## 1 gets the inverse matrix (if it exists in memory)
	## 2 if it exists it will return the inverse matrix and exit the function
	## 3 else (everything after the first return statement can be seen as a kind of an else condition), get the matrix that is stored during the makeCacheMatrix function call
	## 4 inverse this matrix 
	## 5 stores the inverse matrix
	## 6 returns the inverse matrix
## e.g. function call:
	## h <- cacheSolve(w)
## please find additional comments in the function definition as stated below:

cacheSolve <- function(x = matrix(), ...) {

	# get inverse matrix
	i <- x$getInverseMatrix()
	
	# check whether the inverse matrix exists
	if(!is.null(i)) return(i)

	# if no inverse matrix exists, get the one that is created by the makeCacheMatrix function call
	matrix <- x$get()
	
	# inverse the matrix
	i <- solve(matrix, ...)
	
	# store the inverse matrix	
	x$setInverseMatrix(i)
	
	# return inverse matrix
	i
}