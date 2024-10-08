out_dir <- "./inputs"

.args <- if(interactive()){
	file.path(out_dir, "kzn_hiv_model.RData")
}else{
	commandArgs(trailingOnly = TRUE)
}

target <- tail(.args, 1)

#' An age structured compartmental model 
#'
#' @param t model time
#' @param y initial population sizes
#' @param parms model parameters

kzn_hiv_model <- function(t, y, params){
	with(params,{
	
		nn <- names(y)
		S <- as.vector(y[grepl("S_", nn)])
		I1 <- as.vector(y[grepl("I1_", nn)])
		I2 <- as.vector(y[grepl("I2_", nn)])
		I3 <- as.vector(y[grepl("I3_", nn)])
		
		if(length(S) == 1){
			FOI <- beta*(I1 + I2 + I3)/N
		}else{
			infectious <- (I1 + I2 + I3)/N
			FOI <- sapply(1:length(S), function(ii){(beta[ii, ])%*%infectious})
		}
		
		dSdt <- mu*N - mu*S - FOI*S
		dI1dt <- FOI*S -mu*I1 - omega1*I1
		dI2dt <- omega1*I1 - mu*I2 - omega2*I2
		dI3td <- omega2*I2 -mu*I3 -omega3*I3
		
		list(c(dSdt, dI1dt, dI2dt, dI3td))
		
	})
}