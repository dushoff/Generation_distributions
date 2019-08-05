top <- 1600
breaks <- 20
dgen <- dgen[dgen<=40]

funhist(dgen, expfun, finv=logfun, top=top, parms=list(Tc=10))
funhist(dgen, expfun, finv=logfun, top=top, parms=list(Tc=20))
funhist(dgen, expfun, finv=logfun, top=top, parms=list(Tc=30))

## More mathematical explorations
funhist(dgen, logfun, finv=expfun, parms=list(Tc=-1), means=FALSE)
funhist(dgen, logfun, finv=expfun, parms=list(Tc=-1))
funhist(dgen, recip, finv=recip)
funhist(dgen, idfun, finv=idfun)
funhist(dgen, sqfun, finv=rootfun)

