dgen <- dgen[dgen<=40]
funhist(dgen, expfun, finv=logfun, parms=list(Tc=15))
funhist(dgen, expfun, finv=logfun, parms=list(Tc=30))
funhist(dgen, expfun, finv=logfun, parms=list(Tc=45))

funhist(dgen, logfun, finv=expfun, parms=list(Tc=-1), means=FALSE)
funhist(dgen, logfun, finv=expfun, parms=list(Tc=-1))
funhist(dgen, recip, finv=recip)
funhist(dgen, idfun, finv=idfun)
funhist(dgen, sqfun, finv=rootfun)

