#assignment
#store a matrix and cache its inverse (rather than compute it over and over...why is it called this..Algebra?)
#create list to set the value of the matrix, get the value of the matrix,
#set the value of the inverse, get the value of the inverse
#"<<-" searches within our environment only

#set value matrix
	makeCacheMatrix <- function(x = matrix()) {
	n <- NULL
	set <- function(y) {
	x <<- y
	n <<- NULL
	}
	get <- function() x

#get value matrix
	setinverse <- function(inverse) n <<- inverse

#set inverse matrix
	getinverse <- function() n

#get inverse matrix
	list(set = set, get = get,
	setinverse = setinverse,
	getinverse = getinverse)
	}


#Compute/get the inverse from the cache
	cacheSolve <- function(x, ...) {

#get inverse of of 'x'
	n <- x$getinverse()
	if(!is.null(n)) {

#if data exists (not missing)
	message("getting cached data")
	return(n)
	}
	data <- x$get()
#retrieve 
	n <- solve(data,...)
	x$setinverse(n)
	n
	}
	
	## Check to make sure new functions are working
	##Create a matrix
	m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
	m1
	
	
	##Create new object using the functions I built
	myMatrix_object <- makeCacheMatrix(m1)
	cacheSolve(myMatrix_object)
	
	##Check that it retrieves again
	cacheSolve(myMatrix_object)
	