# False position Root finding


falsePosition finds the root of a function using false position method

# Imputs are 
* func (function)
* xl (left bound estimate) 
* xu (right bound estamite)
* es (minimum error to finish (leave blank for acuracy of .0001%))
* maxit (maximum number of loops scrypt will run before self termination. (leave blank for 200 iterations))

# Outputs are
* root (x value at y=0)
* fx (y value of fx at x 
* ea (aproximate error)
* iter (number of loops compleated.)