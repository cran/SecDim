% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sdapredvars.R
\name{sdapredvars}
\alias{sdapredvars}
\title{Preparing explanatory variables data for SDA-based prediction}
\usage{
sdapredvars(xlist)
}
\arguments{
\item{xlist}{A list of the SDA explanatory variables}
}
\value{
A data.frame of variables for prediction or validation
}
\description{
Function for preparing explanatory variables data for
SDA-based prediction or the testing data for cross validation
}
\examples{
data("obs")
data("sample_vars_sda")
obs$Cr_ppm <- log(obs$Cr_ppm)
krm <- rmvoutlier(obs$Cr_ppm)
y <- obs$Cr_ppm[-krm]
x <- list(sample_vars_sda[[1]][-krm, 1:11])
kvalidate <- sample(length(y), 0.3*length(y), replace = FALSE)
yv <- y[kvalidate]
xv <- lapply(x, function(x) x[kvalidate,])
sdaxv <- sdapredvars(xv)
sdayxv <- cbind(yv, sdaxv)

}
