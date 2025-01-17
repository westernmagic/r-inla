%%
%% WARNING! DO NOT EDIT!
%% This file is automatically generated from likelihood.R
%%
 \name{inla.likelihood}
 \alias{likelilhood}

 \title{Compute log-likelihood and CDF for new data using the likeilhood from a inla-object}

 \description{This function computes the log-likeilhood and computes the CDF for new data
 using the likelihood from a inla-object}
 \usage{
     inla.likelihood(y, type = c("loglik", "CDF"), linear.predictor = numeric(0), 
                     family = "gaussian", theta = NULL, E = 1, scale = 1,  
                     Ntrials = 1,  strata = 1,
                     link.model = "default", link.covariates = NULL)
 }

 \arguments{
   \item{y}{Data point/vector}
   \item{type}{Return log-liklihood or the CDF?}
   \item{linear.predictor}{A vector of linear predictors for the liklihood/CDF to be
         evaluated at}
   \item{family}{The family}
   \item{theta}{Vector of hyperparameters in the internal scale, that goes into this likelihood}
   \item{E}{Constrant E for Poisson-like likehoods}
   \item{scale}{scaling, like for Gaussian likehood}
   \item{Ntrails}{Number of trials in Binomial-like likelihood}
   \item{link.model}{The link-model used}
   \item{link.covariates}{Possible covariates that goes into the link.model}
}
\details{Details goes here}
\value{value goes here}
\author{Havard Rue \email{hrue@r-inla.org}}

\examples{
 }
